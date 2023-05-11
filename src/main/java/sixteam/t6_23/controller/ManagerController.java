package sixteam.t6_23.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import sixteam.t6_10.securitymodel.MyUserDetailsService;
import sixteam.t6_10.securitymodel.User;
import sixteam.t6_23.model.matadata.MataDataBean;
import sixteam.t6_23.model.matadata.MataDataService;
import sixteam.t6_23.model.matchsuccessdata.MatchSuccessDataBean;
import sixteam.t6_23.model.matchsuccessdata.MatchSuccessDataService;
import sixteam.t6_23.model.usermatch.UserMatch;
import sixteam.t6_23.model.usermatch.UserMatchService;

@Controller
@SessionAttributes(names = {"LoginOK"})
@RequestMapping("/t6_23")
public class ManagerController {
 
 @Autowired
 private MyUserDetailsService uService;
 
 @Autowired
 private UserMatchService mService;
 
 @Autowired
 private MatchSuccessDataService msdService;
 
 @Autowired
 private MataDataService mdService;
 
// @Secured({ "ROLE_ADMIN" })
 @GetMapping("/dataVhart.controller")
 public String dataPicture(Model m) {
  Double match_true = 0.0;
  Double match_false = 0.0;
  List<MatchSuccessDataBean> msdlist = msdService.findAll();
  Integer number = 0;
  Iterator<MatchSuccessDataBean> iterator = msdlist.iterator();
  while (iterator.hasNext()) {
   MatchSuccessDataBean msdb = (MatchSuccessDataBean) iterator.next();
   String strdate = String.valueOf(msdb.getMatchdate());
   String MM = strdate.substring(5, 7);
   
   String strDateFormat = "MM";
   SimpleDateFormat sdf = new SimpleDateFormat(strDateFormat);
   String format = sdf.format(new Date());
   
   if(MM.equals(format)) {
    number++;
   }
  }
  
  mService.findAll();
  m.addAttribute("number", number);
  return "t6_23/ageDistribution";
 }
 
// @Secured({ "ROLE_ADMIN" })
 @GetMapping("/persons")
 @ResponseBody
 public List<UserMatch> getAllPersons(){
  List<UserMatch> list = mService.findAll();
  
  return list;
 }
 
 @Secured({ "ROLE_ADMIN" })
 @GetMapping("/showAllUsers.controller")
 public String showAllUsers(Principal pc1, Model m) {
//  User user = uService.showUser(pc1.getName());
//  UserMatch userMatch = mService.findByUserid(user.getId());
  List<UserMatch> list = mService.findAll();
   System.out.println("----------------------------------");
  m.addAttribute("bean", list);
  return"t6_23/allUsers";
 }
 
 @Secured({ "ROLE_ADMIN" })
 @PostMapping("/delUser.controller")
 public void deleteById(Principal pc1, @RequestParam("id") int id,@RequestParam("reason") @Nullable String reason) {
  System.out.println("--------------------1  "+id);
  System.out.println("--------------------2  "+reason);
  System.out.println("--------------------3");
  
  User user = uService.showUser(pc1.getName());
  UserMatch userMatch = mService.findByUserid(id);
  MataDataBean mataDataBean = new MataDataBean();
  
  mataDataBean.setUserid(user.getId());
  mataDataBean.setUsername(user.getUserName());
  mataDataBean.setDodate(new Date());
  mataDataBean.setDowhat("DELETE");
  mataDataBean.setText(reason);
  mataDataBean.setAccountid(id);
  mataDataBean.setAccountname(user.getUserName());
  
  mdService.save(mataDataBean);
  mService.deleteById(id);
  
 }
 
 @Secured({ "ROLE_ADMIN" })
 @GetMapping("/check.controller")
 public String changeData(Model m) {
  List<MataDataBean> mdb = mdService.findAll();
  m.addAttribute("MataData", mdb);
  return "t6_23/showAllUsers";
 }
 
 
}