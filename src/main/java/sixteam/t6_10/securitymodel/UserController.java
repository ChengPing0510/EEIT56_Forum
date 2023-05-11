package sixteam.t6_10.securitymodel;

import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.Subject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import sixteam.t6_14.model.ActivesServiceImpl;
import sixteam.t6_14.model.EventRegistService;
import sixteam.t6_14.model.EventRegistrations;
import sixteam.t6_14.model.EventRegistrationsRepository;
import sixteam.t6_14.model.MyFavoriteActiveRepository;
import sixteam.t6_14.model.MyFavoriteActives;
import sixteam.utils.Utils;


//@RequestMapping("/admin")
@Controller
public class UserController {

	@Autowired
	private MyUserDetailsService uService;
	
	@Autowired
	private RegistDateService rService;
	
	@Autowired
	private Utils utils;
	@Autowired
	private ActivesServiceImpl activesServiceImpl;
	@Autowired
	private EventRegistService eventRegistService;
	
	@Autowired
	private EventRegistrationsRepository eRegistrationsRepository;
	@Autowired
	private MyFavoriteActiveRepository myFavRpo;
	
	@Autowired
	private  UserController userController;
	
	@Value("classpath:static/images/0.png")
	private Resource resource;
	
	@Value("classpath:static/images/profile.jpg")
	private Resource profileImg;
	
	@Value("classpath:static/images/unlogin.jpg")
	private Resource unloginImg;
	
	@Value("classpath:static/images/A1.png")
	private Resource defaultImg;

	private HttpServletResponse response;
	

	@GetMapping("/logout-success")
	public String logoutSuccess() {
	return "t6_10/logoutResult";
	}
	
	@GetMapping("/l2")
	public String login2() {
	return "t6_10/login2";
	}
	
	@Secured({"ROLE_ADMIN","ROLE_USER"})
	@GetMapping("/profile")
	public String profile(Model m,Principal p) {
	m.addAttribute("user",uService.showUser(p.getName()));
	return "t6_10/profile";
	}
	
	@GetMapping("/goToIndex")
	public String goToIndex() {
	return "index-background";
	}
	
	@GetMapping("/register.controller")
	public String register() {
	return "t6_10/register";
	}
	
	@GetMapping("/forgot.controller")
	public String goForgot() {
	return "t6_10/forgot";
	}
	
	public String getDateTime(){
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String strDate = sdFormat.format(date);
		//System.out.println(strDate);
		return strDate;
		}
	
	//select RegistDate for chart.js
	@GetMapping("/userCount.controller")
	@ResponseBody
	public long allUserCount() {
		return uService.showCount();
	}
	
	//select RegistDate for chart.js
	@GetMapping("/userRegistDate.controller")
	@ResponseBody
	public List<RegistDate> userRegistDate() {
		List<RegistDate> list = rService.showAllUserDate();
		return list;
	}
	
	
	@Secured({"ROLE_USER"})
	@GetMapping("/date")
	@ResponseBody
	public String date(Principal principal) {
		int id =uService.showUser(principal.getName()).getId();
		RegistDate userDate = rService.showUserDate(id);
		if (userController.getDateTime().equals(userDate.getLastLogin())) {
		// nothing
		}else {
			System.out.println("getDateTime "+userController.getDateTime());
			System.out.println("getLastLogin "+userDate.getLastLogin());
			userDate.setDays(userDate.getDays()+1);
			userDate.setLastLogin(userController.getDateTime());
		}
		rService.saveUserDate(userDate);
		return "登入天數:"+userDate.getDays()+" 註冊日:"+userDate.getRegistDate()+" 最後登入日:"+userDate.getLastLogin()+" ID:"+userDate.getId()+" 現在日期:"+userController.getDateTime();
	}
	
	@PostMapping("/regist.controller")
	public String regist(@RequestParam("username") String username,
			@RequestParam("password") String password, @RequestParam("email") String email, @RequestParam("active") boolean active, @RequestParam("roles") String roles, Model m)
			throws IOException {
		String bCryptPassword = new BCryptPasswordEncoder().encode(password);

			Long size = defaultImg.getFile().length();
			InputStream is = defaultImg.getInputStream();
			try {
				System.out.println(size);
				System.out.println(is);
				Blob img = uService.fileToBlob(is, size);
				uService.addUser(username,bCryptPassword,active,roles,img,email);
				System.out.println("有regist");
			} catch (IOException | SQLException e) {
				System.out.println("預設 檔案錯誤");
				e.printStackTrace();
			}
		return "t6_10/registResult";
	}
	
	@PostMapping("/changepassword.controller")
	public String processResetPassword(@RequestParam("username") String username,@RequestParam("memberpassword") String memberpassword) {
			User user = uService.showUser(username);
			String encodePwd = new BCryptPasswordEncoder().encode(memberpassword);//密碼加密
			user.setPassword(encodePwd);
			uService.modify(user);
		return "t6_10/resetResult";
//		return "front_index";
	}
	
	@PostMapping("/findaccountnumber.controller")
	public String processAction(@RequestParam("username") String username,Model model) {
		model.addAttribute("username",username);
		return "t6_10/reset";
	}
	
	@Secured({"ROLE_ADMIN","ROLE_USER"})
	@GetMapping("t6_10_toUpdateUser.controller/{id}")
	public String showUser(@PathVariable("id") int id, Model m) {
		User user = uService.showUser(id);
		m.addAttribute("user", user);
		return "t6_10/updateUser";
	}
	
//	@PostMapping("/t6_10_delUser.controller")
//	public String deleteUser(@RequestParam("id") Integer userId, Model m) {
//		
//		uService.removeUser(userId);
//		
//		System.out.println("刪除完成 id:"+userId);
//		return "redirect:/t6_10_showAllUser.controller";
//	}
	@PostMapping("/t6_10_delUser.controller")
	public String deleteUserAndOther(@RequestParam("id") Integer userId, Principal p, Model m) {
		User user=uService.showUser(userId);
		rService.removeUserDate(userId);
		if(user!=null) {
			List<EventRegistrations> eventRegistrations=eRegistrationsRepository.findByusers(user);
			List<MyFavoriteActives> myFav=myFavRpo.findByuser(user);
			if(eventRegistrations!=null) {
				for (EventRegistrations eventRegistration : eventRegistrations) {
					eventRegistration.setUsers(null);
					eventRegistration.setActives(null);
				}}
				if(myFav!=null) {
					for (MyFavoriteActives fav : myFav) {
						fav.setUser(null);
						fav.setActive(null);
					}}
			eRegistrationsRepository.deleteAll(eventRegistrations);
			myFavRpo.deleteAll(myFav);
			}
		uService.removeUser(userId);
		
		System.out.println("刪除完成 id:"+userId);
		return "redirect:/t6_10_showAllUser.controller";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@PostMapping("t6_10_doUpdateUser.controller")
	public String updateUser(@RequestParam("id") Integer id, @RequestParam("email") String email,
			@RequestParam(value="active", defaultValue="false") boolean active, @RequestParam("photo") MultipartFile photo, Model m) {
		System.out.println("執行updateUser");
		long size = photo.getSize();
		System.out.println("執行更新 取得的原始資料id"+id);
		User user = uService.showUser(id);
		System.out.println("執行更新 取得的原始資料aBean:"+user);
		if (user == null) {
			return "redirect:/t6_10_showAllUser.controller";
		}
		
		if (size != 0) {
			Blob image;
			try {
				image = uService.fileToBlob(photo);
				System.out.println("更新時給的圖片:"+image);
				user.setImg(image);
			} catch (IOException | SQLException e) {
				System.out.println("SQLException或IOException!");
				e.printStackTrace();
			}
		}
		System.out.println("更新時給的email:"+email);
		System.out.println("更新時給的狀態:"+active);
		user.setEmail(email);
		user.setActive(active);
		uService.modify(user);
		System.out.println("修改完"+user);
		List<User> list = uService.showAllUsers();
		System.out.println("立刻查全部準備放AT");
		m.addAttribute("users", list);
		System.out.println("放完AT"+list);
		return "t6_10/allUsers";
	}
	
	@GetMapping("t6_10_toAddUser.controller")
	public String toAddAccount(Model m) {
		User user = new User();
		m.addAttribute("user", user);
		return "t6_10/addUser";
	}
	
	@PostMapping("/t6_10_doAddUser.controller")
	public String processAction(@RequestParam("username") String username,
			@RequestParam("password") String password, @RequestParam("email") String email, @RequestParam("photo") MultipartFile photo, @RequestParam("active") boolean active, @RequestParam("roles") String roles, Model m)
			throws IOException {
		String bCryptPassword = new BCryptPasswordEncoder().encode(password);
		long size = photo.getSize();

		if (size != 0) {
			Blob img;
			try {
				img = uService.fileToBlob(photo);
				uService.addUser(username,bCryptPassword,active,roles,img,email);
			} catch (IOException | SQLException e) {
				System.out.println("自訂 檔案錯誤");
				e.printStackTrace();
			}
		} else {

			size = resource.getFile().length();
			InputStream is = resource.getInputStream();
			try {
				System.out.println(size);
				System.out.println(is);
				Blob img = uService.fileToBlob(is, size);
				uService.addUser(username,bCryptPassword,active,roles,img,email);
				System.out.println("有add");
			} catch (IOException | SQLException e) {
				System.out.println("預設 檔案錯誤");
				e.printStackTrace();
			}
		}
		return "redirect:t6_10_showAllUser.controller";
	}
	
	
	@GetMapping("/t6_10_showNowImg.controller") //用於前端找用戶 不存在傳送預設
	@ResponseBody
	public byte[] ShowNowImg(Principal principal, HttpServletRequest request,
			HttpServletResponse response){
		try {
		if (principal==null ||  uService.showUser(principal.getName()).getImg()==null) {
			System.out.println("principal是空的或後面那位是空的");
			return IOUtils.toByteArray(resource.getInputStream());
		}
			System.out.println("下面報錯的話應該是沒圖?");
			return IOUtils.toByteArray(uService.showUser(principal.getName()).getImg().getBinaryStream());
		} catch (IOException | SQLException e) {
			System.out.println("IOException | SQLException");
			e.printStackTrace();
		}
		System.out.println("強迫回傳爆掉圖");
		return null;
	}
	
	@GetMapping("/t6_10_showStatusImg.controller") //用於前端找用戶 不存在傳送預設
	@ResponseBody
	public byte[] ShowStatusNowImg(Principal principal, HttpServletRequest request,
			HttpServletResponse response){
		try {
		if (principal==null){
			return IOUtils.toByteArray(unloginImg.getInputStream());
		}
			return IOUtils.toByteArray(profileImg.getInputStream());
		} catch (IOException e) {
			System.out.println("IOException | SQLException");
			e.printStackTrace();
		}
		System.out.println("強迫回傳爆掉圖");
		return null;
	}
	
	@GetMapping("/t6_10_UserImg.controller/{id}")
	@ResponseBody
	public byte[] processByteArrayImageAction(@PathVariable("id") int userId, HttpServletRequest request,
			HttpServletResponse response){
		User user = uService.showUser(userId);
		Blob pBlob = user.getImg();
		if (pBlob==null) {
			System.out.println("圖片為空");
			return null;
		}
		try {
			InputStream binaryStream = pBlob.getBinaryStream();
			return IOUtils.toByteArray(binaryStream);
		} catch (SQLException | IOException e) {
			System.out.println("無法解析圖片(UserController)");
			e.printStackTrace();
		}
		return null;
	}
	
	// 注意
	@GetMapping("t6_10_showAllUser.controller")
	public String showAllUser(Model m) {
		List<User> users = uService.showAllUsers();
		System.out.println(users);
		for (User user : users) {
			System.out.println(user.getId());
			System.out.println(user.getUserName());
			System.out.println(user.getPassword());
			System.out.println(user.getRoles());
		}
		System.out.println("全都查好了準備放進addAttribute");
		m.addAttribute("users", users);
		System.out.println("放進addAttribute，準備前往allUsers");
		return "t6_10/allUsers";
	}
	
	@PostMapping("/doAddUser.controller")
	public String addUser(@RequestParam("username") String username,
			@RequestParam("password") String password, @RequestParam("active") boolean active,@RequestParam("roles") String roles, Model m) {
		String bCryptPassword = new BCryptPasswordEncoder().encode(password);
		User user = new User(username,bCryptPassword,active,roles);
		System.out.println(username);
		System.out.println(bCryptPassword);
		System.out.println(active);
		System.out.println(roles);
		uService.addUser(user);
		return "welcome";
	}
	
	@PostMapping(path = "/checkUsername.controller",produces="application/json;charset=UTF-8")
	@ResponseBody
	public String checkUsername(@RequestParam("username") String username) {
		boolean isRepeat;
		isRepeat = uService.checkUser(username);
		if(isRepeat) {
		return "帳號重複";
		}
		return "帳號是新的";
	}
	
	
	@ResponseBody
	@PostMapping(path = "/checkPassword.controller",produces="application/json;charset=UTF-8")
	public String checkPassword(Principal p,@RequestParam("password") String password,@RequestParam("newpassword") String  newpassword) throws SQLException {
		boolean pwdRight;
//		pwdRight = uService.checkPassword(p,password,newpassword);
		User user = uService.showUser(p.getName());
		String pwd = user.getPassword();
		pwdRight = new BCryptPasswordEncoder().matches(password,pwd);
		if(pwdRight) {
		System.out.println("controller 密碼正確");
		user.setPassword(new BCryptPasswordEncoder().encode(newpassword));
		uService.modify(user);
		return "密碼正確";
		}
		System.out.println("controller 密碼錯誤");
		return "密碼錯誤";
	}
	
	
//	@PostMapping("/register.controller")
//	public String processAction(@RequestParam("userName") String user, @RequestParam("userPwd") String pwd, Model m) {
//		System.out.println("進入register.controller");
//		Map<String, String> errors = new HashMap<String, String>();
//		m.addAttribute("errors", errors);
//		
//		if(user==null || user.length()==0) {
//			errors.put("name", "帳號為必填");
//		}
//		
//		if(pwd==null || pwd.length()==0) {
//			errors.put("pwd", "密碼為必填");
//		}
//		
//		if(errors!=null && !errors.isEmpty()) {
//			return "t6_10/adminLogin";
//		}
//		
////		boolean status = aService.checkLogin(new AccountManager(user, pwd));
//		boolean status = true;
//		if(status) {
//			System.out.println("=========Success===========");
//			return "redirect:t6_10_showAll.controller";
//		}
//		
//		errors.put("msg", "請輸入正確的帳號或密碼");		
////		return "t6_10/adminLogin";
//		return "t6_10/adminLogin";
//			
//		}
	
}
