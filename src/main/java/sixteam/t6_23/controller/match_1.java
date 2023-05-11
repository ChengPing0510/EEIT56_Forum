package sixteam.t6_23.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import sixteam.t6_10.securitymodel.MyUserDetailsService;
import sixteam.t6_10.securitymodel.User;
import sixteam.t6_23.model.fraction.Fraction;
import sixteam.t6_23.model.fraction.FractionService;
import sixteam.t6_23.model.matchcondition.MatchCondition;
import sixteam.t6_23.model.matchcondition.MatchConditionService;
import sixteam.t6_23.model.matchsuccessdata.MatchSuccessDataBean;
import sixteam.t6_23.model.matchsuccessdata.MatchSuccessDataService;
import sixteam.t6_23.model.usermatch.UserMatch;
import sixteam.t6_23.model.usermatch.UserMatchService;

@Controller
@RequestMapping("/t6_23")
@SessionAttributes(names = { "totalPages", "tota;Elements","LoginOK" })
public class match_1 {

 @Autowired
 private MyUserDetailsService uService;

 @Autowired
 private UserMatchService mService;
 
 @Autowired
 private FractionService fService;
 
 @Autowired
 private MatchSuccessDataService msdService;
 
 @Autowired
 private MatchConditionService mcService;
 

 @Secured({ "ROLE_USER", "ROLE_ADMIN" })
 @GetMapping("/go.controller")
 public String checkLogin() {

  return "t6_23/go";

 }

 @Secured({ "ROLE_USER", "ROLE_ADMIN" })
 @GetMapping("/iWantMatch.controller")
 public String match01(Principal pc1) {
  User user = uService.showUser(pc1.getName());
  UserMatch userMatch = mService.findByUserid(user.getId());
  if (userMatch == null || userMatch.getFractionid() == null || userMatch.getUserid() == null) {
   return "t6_23/goMatch";
  }
  
  // 配對條件---存登入帳號的ID
  MatchCondition matchCondition = mcService.findByUserId(user.getId());
  
  if(matchCondition == null) {
   MatchCondition matchCondition2 = new MatchCondition();
   
   matchCondition2.setUserid(user.getId());
   matchCondition2.setMsex(false);
   matchCondition2.setMreligion(false);
   matchCondition2.setMhobby(false);
   matchCondition2.setMaddress(false);
   
   mcService.save(matchCondition2);
   
  }

  return "t6_23/selectMatch";
 }

 @Secured({ "ROLE_USER", "ROLE_ADMIN" })
 @PostMapping("/matchStar.controller")
 public String goMatch1(Principal pc1, @RequestParam("name") String name, @RequestParam("age") String age,
   @RequestParam("city") String city, @RequestParam("place") @Nullable String place,
   @RequestParam("gender") String gender, @RequestParam("religion") @Nullable String religion,
   @RequestParam("star_sign") String starsign, @RequestParam("blood_type") String bloodtype,
   @RequestParam("photo") @Nullable MultipartFile mf, @RequestParam("emotion") String emotion, Model m,
   @RequestParam("line_qrcode") @Nullable MultipartFile mf2) throws IOException {
  UserMatch userpk = new UserMatch();
  User user = uService.showUser(pc1.getName());
  Map<String, String> errors = new HashMap<String, String>();
  m.addAttribute("errors", errors);

  Double ageValue = 0.0;
  Double starValue = 0.0;
  Double bloobValue = 0.0;
  Double religionValue = 0.0;
  Double value;
  String score;
  
  
  if (name == null || name.length() == 0) {
   errors.put("ename", "暱稱不能為空");
  } else {
   userpk.setName(name);
  }

  if (age == null || age.length() == 0) {
   errors.put("eage", "請選擇年齡");
  } else {
   userpk.setAge(age);

   switch (age) {
   case "18~22":
    ageValue = 3.5;
    break;
   case "23~27":
    ageValue = 4.0;
    break;
   case "28~32":
    ageValue = 5.0;
    break;
   case "33~37":
    ageValue = 5.5;
    break;
   case "38~42":
    ageValue = 6.5;
    break;
   case "43~47":
    ageValue = 7.0;
    break;
   case "48~52":
    ageValue = 7.5;
    break;
   case "53~63":
    ageValue = 8.5;
    break;
   case "64以上":
    ageValue = 9.0;
    break;
   default:
    ageValue = 0.5;
    break;
   }
  }

  if (gender == null || gender.length() == 0) {
   errors.put("egender", "請選擇您的性別");
  } else {
   userpk.setSex(gender);
  }

  if (religion == null || religion.length() == 0) {
   errors.put("ereligion", "請選擇您信仰的宗教");
  } else {
   userpk.setReligion(religion);
   switch (religion) {
   case "道教":
   case "軒轅教":
   case "一貫道":
   case "天帝教":
    religionValue = 4.0;
    break;
   case "佛教":
   case "彌勒大道":
   case "天德聖教":
   case "先天救教":
    religionValue = 5.0;
    break;
   case "天道":
   case "三一教":
   case "理教":
    religionValue = 4.5;
    break;
   case "猶太教":
   case "天主教":
   case "基督教":
   case "東正教":
    religionValue = 7.5;
    break;
   case "天理教":
   case "摩門教":
   case "統一教":
    religionValue = 7.0;
    break;
   case "巴哈尹教":
   case "真光教團":
   case "山達基":
    religionValue = 6.5;
    break;
   case "伊斯蘭教":
    religionValue = 9.0;
    break;

   default:
    religionValue = 3.0;
    break;
   }
  }

  if (starsign == null || starsign.length() == 0) {
   errors.put("estarsign", "請選擇星座");
  } else {
   userpk.setStar(starsign);

   switch (starsign) {
   case "摩羯座":
   case "金牛座":
   case "處女座":
    starValue = 3.0;
    break;
   case "水瓶座":
   case "天秤座":
   case "雙子座":
    starValue = 4.0;
    break;
   case "雙魚座":
   case "巨蟹座":
   case "天蠍座":
    starValue = 5.0;
    break;
   case "牡羊座":
   case "射手座":
   case "獅子座":
    starValue = 6.0;
    break;
   }
  }

  if (bloodtype == null || bloodtype.length() == 0) {
   errors.put("ebloodtype", "請選擇血型");
  } else {
   userpk.setBloobtype(bloodtype);

   if (gender.equals("男")) {
    switch (bloodtype) {
    case "A":
     bloobValue = 9.0;
     break;
    case "B":
     bloobValue = 8.0;
     break;
    case "O":
     bloobValue = 7.0;
     break;
    case "AB":
     bloobValue = 5.0;
     break;
    }
   } else {
    switch (bloodtype) {
    case "A":
     bloobValue = 7.0;
     break;
    case "B":
     bloobValue = 8.0;
     break;
    case "O":
     bloobValue = 9.0;
     break;
    case "AB":
     bloobValue = 5.0;
     break;
    }

   }
  }
  
  value = ((starValue * bloobValue + ageValue * ageValue ) * religionValue/1215.0)*100.0;
  
  if(value > 80.0) {
   score = "80以上";
  }else if(80.0 >= value && value > 60.0) {
   score = "80~60";
  }else if (60.0 >= value && value > 40.0) {
   score = "60~40";
  }else if (40.0 >= value && value > 20.0) {
   score = "40~20";
  }else if (20.0 >= value && value > 8.0) {
   score = "20~6";
  }else {
   score = "6以下";
  }

  String fileName = mf.getOriginalFilename();
  byte[] b = mf.getBytes();
  if (fileName != null && fileName.length() != 0) {
   userpk.setImages(b);
  }
  String fileName2 = mf2.getOriginalFilename();
  byte[] b2 = mf2.getBytes();
  if (fileName2 != null && fileName2.length() != 0) {
   userpk.setLine_qrcode(b2);
  }else {
   errors.put("eqrcode", "請上傳Line的個人QRcode，這樣他人才能與你進行配對");
  }

  if (errors != null && !errors.isEmpty()) {
   return "t6_23/goMatch";
  }
  
  String address = city+place;
  userpk.setAddress(address);

  if(emotion == null || emotion.length() == 0) {
   emotion = "我想認識" + religion + "的人";
  }
  
  userpk.setMatch(true);
  userpk.setEmotion(emotion);
  mService.insert(userpk);

  Fraction fraction = fService.findByScore(score);
  
  userpk.setFractionid(fraction.getId());
  userpk.setUserid(user.getId());
  mService.insert(userpk);
  
  
  // 配對條件---存登入帳號的ID
  MatchCondition matchCondition = mcService.findByUserId(user.getId());
  
  if(matchCondition == null) {
   MatchCondition matchCondition2 = new MatchCondition();
   
   matchCondition2.setUserid(user.getId());
   matchCondition2.setMsex(false);
   matchCondition2.setMreligion(false);
   matchCondition2.setMhobby(false);
   matchCondition2.setMaddress(false);
   
   mcService.save(matchCondition2);
   
  }
  
  
  return "t6_23/selectMatch";
 }
 
 @Secured({ "ROLE_USER", "ROLE_ADMIN" })
 @PostMapping("/findMatch.controller")
 @ResponseBody
 public Set<UserMatch> findMatchUser(Principal pc1){ //查分數相同的人
  User user = uService.showUser(pc1.getName());
  UserMatch userMatch = mService.findByUserid(user.getId());
  Set<UserMatch> set = mService.findByFractionAndUserid(userMatch.getFractionid(), user.getId());
  System.out.println("666666666666666    "+user.getId());
  
  Iterator<UserMatch> iterator = set.iterator();
  while(iterator.hasNext()) {
   UserMatch um = iterator.next();
   System.out.println(um.getUserid());
   
   if(um.getEmotion()==null||um.getEmotion().length()==0) {
    String religion = um.getReligion();
    um.setEmotion("我想認識"+religion+"的人");
    mService.insert(um);
   }
  }
  
  return set;
 }
 
 @GetMapping(path = "/getImages.controller/{id}", produces = "text/plain;charset=UTF-8")
 @ResponseBody
 public byte[] processButeArrayImageAction(@PathVariable("id") Integer id)
   throws IOException{
  UserMatch userMatch = mService.findById(id);
  byte[] images = userMatch.getImages();
  ByteArrayInputStream in = new ByteArrayInputStream(images);
  
  return IOUtils.toByteArray(in);
 }
 
 @Secured({ "ROLE_USER", "ROLE_ADMIN" })
 @GetMapping("/scanMatcherUser.controller/{id}")
 public String scanMatchUser(@PathVariable("id") Integer id, Model m) { //配對人資料1 
  UserMatch userMatch = mService.findById(id);
  m.addAttribute("bean", userMatch);
  
  return "t6_23/scanUserData";
 }
 
 @Secured({ "ROLE_USER", "ROLE_ADMIN" })
 @PostMapping("/scanMatcherUser2.controller/{id}")
 @ResponseBody
 public UserMatch scanMatchUser(@PathVariable("id") Integer id) { //配對人資料2
  UserMatch userMatch = mService.findById(id);
  
  return userMatch;
 }
 
 @Secured({ "ROLE_USER", "ROLE_ADMIN" })
 @GetMapping("/goback.controller")
 public String goback() {
  return "t6_23/selectMatch";
 }
 
 @Secured({ "ROLE_USER", "ROLE_ADMIN" })
 @GetMapping("/research.controller")
 public String research() {
  return "t6_23/matchAgain";
 }
 
 @Secured({ "ROLE_USER", "ROLE_ADMIN" })
 @GetMapping("/matchSuccess.controller/{id}")
 public String matchSuccess(Principal pc1, @PathVariable("id") Integer id, Model m) { //配對成功後
  User user = uService.showUser(pc1.getName());
  UserMatch userMatch1 = mService.findByUserid(user.getId());
  
  MatchSuccessDataBean msdb = new MatchSuccessDataBean();
  msdb.setMatchdate(new Date());
  msdb.setUserid_1(userMatch1.getId());
  msdb.setUserid_2(id);
  
  msdService.insert(msdb);
  
  UserMatch matchedUser = mService.findById(id);
  if(matchedUser.getLine_qrcode()==null) {
   UserMatch getLine = mService.findById(1040);
  matchedUser.setLine_qrcode(getLine.getLine_qrcode());
  mService.insert(matchedUser);
  }
  
  
  m.addAttribute("bean", matchedUser);
  
  return "t6_23/matchSuccess";
 }
 
 @GetMapping(path = "/getline.controller/{id}", produces = "text/plain;charset=UTF-8")
 @ResponseBody
 public byte[] processButeArrayLineAction(@PathVariable("id") Integer id)
   throws IOException{
  UserMatch userMatch = mService.findById(id);
  byte[] images = userMatch.getLine_qrcode();
  ByteArrayInputStream in = new ByteArrayInputStream(images);
  
  return IOUtils.toByteArray(in);
 }
 
 @Secured({ "ROLE_USER", "ROLE_ADMIN" })
 @GetMapping("/upDateMatchData.controller")
 public String updateUserMatchData(Principal pc1, Model m) { //修改資料
  User user = uService.showUser(pc1.getName());
  UserMatch userMatch1 = mService.findByUserid(user.getId());
  
  if(userMatch1 != null) {
   m.addAttribute("bean", userMatch1);
   
   String address = userMatch1.getAddress();
   if(address!=null) {
    address.trim();
   m.addAttribute("city", address.substring(0, 3));
   m.addAttribute("place", address.substring(3));
   }
   
  }
  
  return "t6_23/userData";
 }
 
 @Secured({ "ROLE_USER", "ROLE_ADMIN" })
 @PostMapping("/saveUserData.controller")
 public String saveUserData(Principal pc1, @RequestParam("name") String name, @RequestParam("age") String age,
   @RequestParam("city") String city, @RequestParam("place") @Nullable String place,
   @RequestParam("gender") String gender, @RequestParam("religion") String religion,
   @RequestParam("star_sign") String starsign, @RequestParam("blood_type") String bloodtype,
   @RequestParam("photo") MultipartFile mf, @RequestParam("emotion") String emotion, Model m,
   @RequestParam("profession") String profession, @RequestParam("checkboxVaule_1") String checkboxStatus_1,
   @RequestParam("line_qrcode") MultipartFile mf2) throws IOException {
  UserMatch userpk = new UserMatch();
  User user = uService.showUser(pc1.getName());
  Map<String, String> errors = new HashMap<String, String>();
  m.addAttribute("errors", errors);

  Double ageValue = 0.0;
  Double starValue = 0.0;
  Double bloobValue = 0.0;
  Double religionValue = 0.0;
  Double value;
  String score;
  
  UserMatch um = mService.findByUserid(user.getId());
  if(um != null) {
   userpk.setId(um.getId());
  }
  
  if (name == null || name.length() == 0) {
   errors.put("ename", "暱稱不能為空");
  } else {
   userpk.setName(name);
  }

  if (age == null || age.length() == 0) {
   errors.put("eage", "請選擇年齡");
  } else {
   userpk.setAge(age);

   switch (age) {
   case "18~22":
    ageValue = 3.5;
    break;
   case "23~27":
    ageValue = 4.0;
    break;
   case "28~32":
    ageValue = 5.0;
    break;
   case "33~37":
    ageValue = 5.5;
    break;
   case "38~42":
    ageValue = 6.5;
    break;
   case "43~47":
    ageValue = 7.0;
    break;
   case "48~52":
    ageValue = 7.5;
    break;
   case "53~63":
    ageValue = 8.5;
    break;
   case "64以上":
    ageValue = 9.0;
    break;
   default:
    ageValue = 0.5;
    break;
   }
  }

  if (gender == null || gender.length() == 0) {
   errors.put("egender", "請選擇您的性別");
  } else {
   userpk.setSex(gender);
  }

  if (religion == null || religion.length() == 0) {
   errors.put("ereligion", "請選擇您信仰的宗教");
  } else {
   userpk.setReligion(religion);
   switch (religion) {
   case "道教":
   case "軒轅教":
   case "一貫道":
   case "天帝教":
    religionValue = 4.0;
    break;
   case "佛教":
   case "彌勒大道":
   case "天德聖教":
   case "先天救教":
    religionValue = 5.0;
    break;
   case "天道":
   case "三一教":
   case "理教":
    religionValue = 4.5;
    break;
   case "猶太教":
   case "天主教":
   case "基督教":
   case "東正教":
    religionValue = 7.5;
    break;
   case "天理教":
   case "摩門教":
   case "統一教":
    religionValue = 7.0;
    break;
   case "巴哈尹教":
   case "真光教團":
   case "山達基":
    religionValue = 6.5;
    break;
   case "伊斯蘭教":
    religionValue = 9.0;
    break;

   default:
    religionValue = 3.0;
    break;
   }
  }

  if (starsign == null || starsign.length() == 0) {
   errors.put("estarsign", "請選擇星座");
  } else {
   userpk.setStar(starsign);

   switch (starsign) {
   case "摩羯座":
   case "金牛座":
   case "處女座":
    starValue = 3.0;
    break;
   case "水瓶座":
   case "天秤座":
   case "雙子座":
    starValue = 4.0;
    break;
   case "雙魚座":
   case "巨蟹座":
   case "天蠍座":
    starValue = 5.0;
    break;
   case "牡羊座":
   case "射手座":
   case "獅子座":
    starValue = 6.0;
    break;
   }
  }

  if (bloodtype == null || bloodtype.length() == 0) {
   errors.put("ebloodtype", "請選擇血型");
  } else {
   userpk.setBloobtype(bloodtype);

   if (gender.equals("男")) {
    switch (bloodtype) {
    case "A":
     bloobValue = 9.0;
     break;
    case "B":
     bloobValue = 8.0;
     break;
    case "O":
     bloobValue = 7.0;
     break;
    case "AB":
     bloobValue = 5.0;
     break;
    }
   } else {
    switch (bloodtype) {
    case "A":
     bloobValue = 7.0;
     break;
    case "B":
     bloobValue = 8.0;
     break;
    case "O":
     bloobValue = 9.0;
     break;
    case "AB":
     bloobValue = 5.0;
     break;
    }

   }
  }
  
  value = ((starValue * bloobValue + ageValue * ageValue ) * religionValue/1215.0)*100.0;
  
  if(value > 80.0) {
   score = "80以上";
  }else if(80.0 >= value && value > 60.0) {
   score = "80~60";
  }else if (60.0 >= value && value > 40.0) {
   score = "60~40";
  }else if (40.0 >= value && value > 20.0) {
   score = "40~20";
  }else if (20.0 >= value && value > 8.0) {
   score = "20~6";
  }else {
   score = "6以下";
  }

  if(um==null) {
   if(mf.isEmpty()) {
    
   }
   
  
  }
  String fileName = mf.getOriginalFilename();
  byte[] b = mf.getBytes();
  if (fileName != null && fileName.length() != 0) {
   userpk.setImages(b);
  }else {
	userpk.setImages(um.getImages());
}
  
  String fileName2 = mf2.getOriginalFilename();
  byte[] b2 = mf2.getBytes();
  if (fileName2 != null && fileName2.length() != 0) {
   userpk.setLine_qrcode(b2);
  }else {
//   errors.put("eqrcode", "請上傳Line的個人QRcode，這樣他人才能與你進行配對");
	 userpk.setLine_qrcode(um.getLine_qrcode());
  }
  
  if(profession == null || profession.length() == 0) {
   
  }else {
   userpk.setPersonality(profession);
  }

  if (errors != null && !errors.isEmpty()) {
   return "t6_23/userData";
  }
  
  String address = city+place;
  userpk.setAddress(address);

  if(emotion == null || emotion.length() == 0) {
   emotion = "我想認識" + religion + "的人";
  }
  
  if(checkboxStatus_1.equals("on")) {
   userpk.setMatch(true);
  }else {
   userpk.setMatch(false);
  }
  
  userpk.setEmotion(emotion);
  mService.insert(userpk);
  
  Fraction fraction = fService.findByScore(score);
  
  userpk.setFractionid(fraction.getId());
  userpk.setUserid(user.getId());
  mService.insert(userpk);
  
  
  return "t6_23/saveUserDataSuccess";
 }
 
 @Secured({ "ROLE_USER", "ROLE_ADMIN" })
 @PostMapping("/matchStar2.controller")
 public String matchStar2(Principal pc1, @RequestParam("profession") @Nullable String profession) {
  User user = uService.showUser(pc1.getName());
  UserMatch userMatch = mService.findByUserid(user.getId());
  
  userMatch.setProfession(profession);
  mService.insert(userMatch);
  
  return "t6_23/selectMatch2";
 }
 
 @Secured({ "ROLE_USER", "ROLE_ADMIN" })
 @PostMapping("/findMatch2.controller")
 @ResponseBody
 public Set<UserMatch> findMatchUser2(Principal pc1){ //查分數相同的人
  User user = uService.showUser(pc1.getName());
//  UserMatch userMatch = mService.findByUserid(user.getId());
  Set<UserMatch> set = mService.findByUseridAndMatch(user.getId());
  System.out.println("666666666666666    "+user.getId());
  
  Iterator<UserMatch> iterator = set.iterator();
  while(iterator.hasNext()) {
   UserMatch um = iterator.next();
   System.out.println(um.getUserid());
   
   if(um.getEmotion()==null||um.getEmotion().length()==0) {
    String religion = um.getReligion();
    um.setEmotion("我想認識"+religion+"的人");
    mService.insert(um);
   }
  }
  
  return set;
 }

}