package sixteam.t6_10.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sixteam.t6_10.model.AccountManager;
import sixteam.t6_10.model.AccountManagerService;

@Controller
public class AccountmanagerLoginController {

	@Autowired
	private AccountManagerService aService;
	
	@GetMapping("/adminLogin.controller")
	public String processMainAction() {
		return "t6_10/adminLogin";
	}
	
	@PostMapping("/checklogin.controller")
	public String processAction(@RequestParam("userName") String user, @RequestParam("userPwd") String pwd, Model m) {
		System.out.println("進入checklogin.controller");
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		
		if(user==null || user.length()==0) {
			errors.put("name", "帳號為必填");
		}
		
		if(pwd==null || pwd.length()==0) {
			errors.put("pwd", "密碼為必填");
		}
		
		if(errors!=null && !errors.isEmpty()) {
			return "t6_10/adminLogin";
		}
		
		boolean status = aService.checkLogin(new AccountManager(user, pwd));
		
		if(status) {
			System.out.println("=========Success===========");
			return "redirect:t6_10_showAll.controller";
		}
		
		errors.put("msg", "請輸入正確的帳號或密碼");		
//		return "t6_10/adminLogin";
		return "t6_10/adminLogin";
			
		}
	}


