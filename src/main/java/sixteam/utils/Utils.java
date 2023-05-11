package sixteam.utils;

import java.security.Principal;
import java.sql.Blob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sixteam.t6_10.securitymodel.MyUserDetailsService;
import sixteam.t6_10.securitymodel.User;

@Controller
public class Utils {
	
	@Autowired
	private MyUserDetailsService uService;
	
	
	
//	@ResponseBody
//	@GetMapping("/get-user-id")
//	public int getUserId(Principal principal) {
//	MyUserDetails user = (MyUserDetails)uService.loadUserByUsername(principal.getName());
//	int userId = user.getId();
//	// Do something with userId
//	return userId;
//	}
	
	@ResponseBody
	@GetMapping("/who")
	public String who(Principal principal) {
	// Do something with userId
		System.out.println("準備爆炸");
		System.out.println("不知道也能GET:"+principal.getName());
//	return principal.getName();
		return "me";
	}
	
	public User getUser(Principal principal) {
	return uService.showUser(principal.getName());
	}
	
	public int getUserId(Principal principal) {
	return uService.showUser(principal.getName()).getId();
	}
	
	public String getEmail(Principal principal) {
	return uService.showUser(principal.getName()).getEmail();
	}
	
	public Blob getImg(Principal principal) {
	return uService.showUser(principal.getName()).getImg();
	}
	
	public String getRoles(Principal principal) {
	return uService.showUser(principal.getName()).getRoles();
	}
	
	public String getName(Principal principal) {
	return principal.getName();
	}
	
	
}
