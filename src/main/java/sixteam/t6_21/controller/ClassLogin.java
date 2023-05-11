package sixteam.t6_21.controller;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import sixteam.t6_10.securitymodel.MyUserDetails;
import sixteam.t6_10.securitymodel.MyUserDetailsService;
import sixteam.t6_10.securitymodel.User;

@Controller
@SessionAttributes(names = {"LoginOK","ShoppingCart"})
public class ClassLogin {

//	@Autowired
//	private MemberService mService;
	@Autowired
	private MyUserDetailsService uService;

	@GetMapping("/t6_21adminLogin.controller")
	public String processMainAction() {
		return "t6_21/TestLogin";
	}

//	@PostMapping("/t6_21checklogin.controller")
//	public String processAction(@RequestParam("userName") String user, @RequestParam("userPwd") String pwd, Model m,
//			HttpServletRequest request, HttpSession session) {
//		System.out.println("進入checklogin.controller");
//		Map<String, String> errors = new HashMap<String, String>();
//		m.addAttribute("errors", errors);
//
//		if (user == null || user.length() == 0) {
//			errors.put("name", "帳號為必填");
//		}
//
//		if (pwd == null || pwd.length() == 0) {
//			errors.put("pwd", "密碼為必填");
//		}
//
//		if (errors != null && !errors.isEmpty()) {
//			return "t6_21/TestLogin";
//		}
//		MemberBean mbBean = new MemberBean(user, pwd);
//		boolean status = mService.checkLogin(mbBean);
//
//		if (status) {
//			System.out.println("=========Success===========");
//			session.setAttribute("LoginOK", mbBean);
//			return "t6_21/OrderConfirm";
//		}
//
//		errors.put("msg", "請輸入正確的帳號或密碼");
//		return "t6_21/TestLogin";
//
//	}
	
	@Secured({"ROLE_USER","ROLE_ADMIN"}) //身分驗證
	@GetMapping("/shoppingCartCheckout.controller")
	public String processAction(Principal pc1,Model m, HttpServletRequest request, HttpSession session) throws IOException {
		
//		Principal pc = (Principal) session.getAttribute("LoginOK");
		System.out.println("pc1"+pc1);
		System.out.println("pc1 getname"+pc1.getName());
		System.out.println((MyUserDetails) uService.loadUserByUsername(pc1.getName()));
		User user = uService.showUser(pc1.getName());
		session.setAttribute("LoginOK", user);
//		if (memberBean != null) {
//			session.setAttribute("LoginOK", memberBean);
			return "t6_21/OrderConfirm";
			
//		} 
//		else {
//			return "t6_21/TestLogin";
//
//		}
	}

}
