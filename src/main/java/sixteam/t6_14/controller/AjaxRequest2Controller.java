package sixteam.t6_14.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import sixteam.t6_14.model.ActiveService;
import sixteam.t6_14.model.Actives;

@RestController
@SessionAttributes(names = {"LoginOK"})
@RequestMapping("/ajax")
public class AjaxRequest2Controller {
	@Autowired
	private ActiveService activeService;
	
	@GetMapping("/ajaxrequest2")
	public String ajaxRequest(@RequestParam("usercode") String usercode,@RequestParam("username")String username) {
//		return"<font color='red'>帳號已存在</font>";
		return"username="+username+",usercode="+usercode;
	}
	
	@PostMapping("/ajaxrequest3")
	public String ajaxPost(@RequestParam("username") String username,@RequestParam("pwd")String password) {
//		return "<font color='red'>帳號已存在</font>";
		return"帳號是"+username+",密碼是"+password;
	}
	@PostMapping("/ajaxrequest5")
	public String ajaxPost2(@RequestParam("username") String name) {
		Actives active=activeService.findByActivesName(name);
		if(active!=null) {
			return"<font color='red'>用戶已存在</font>";
		}else {
			return"<font color='green'>用戶不存在，可使用</font>";
		}
	}
	@GetMapping("ajaxrequest5")
	public String ajaxStudent() {
//		return"  <tr>\r\n"
//				+ "                <td>1</td>\r\n"
//				+ "                <td>小明</td>\r\n"
//				+ "                <td>20</td>\r\n"
//				+ "                <td>台北淡水</td>\r\n"
//				+ "            </tr>\r\n"
//				+ "            <tr>\r\n"
//				+ "                <td>2</td>\r\n"
//				+ "                <td>曉華</td>\r\n"
//				+ "                <td>25</td>\r\n"
//				+ "                <td>台南清水</td>\r\n"
//				+ "            </tr>";
 String jsonStr="[{\"name\":\"小湖\",\"age\":20,\"addr\":\"台北\"}\r\n"
 		+ ",{\"name\":\"大華\",\"age\":30,\"addr\":\"台南\"}]";
 return jsonStr;
	}
	
	@GetMapping("/ajax7")
	public List<Actives> findAll() {
		List<Actives> active = activeService.findAll();
		return active;
	}
	@GetMapping(value = "/ajaxrequest6",produces = { "application/xml", "text/xml" })
	public String ajaxXml() {
		return"<students>\r\n"
				+ "    <student>\r\n"
				+ "        <name>張三</name>\r\n"
				+ "        <age>20</age>\r\n"
				+ "    </student>\r\n"
				+ "    <student>\r\n"
				+ "        <name>李四</name>\r\n"
				+ "        <age>40</age>\r\n"
				+ "    </student>\r\n"
				+ "</students>";
	}
	@GetMapping("/ajaxrequest8")
	public String ajax8() {
		try {
			Thread.sleep(10*1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return"ajax請求1";
	}
	@GetMapping("/ajaxrequest9")
	public String ajax9() {
		return"ajax請求2";
	}
	@PostMapping("/ajaxrequest10")
	public String ajax11(@RequestParam("username") String name) {
		
		return"{\"uname\":\""+name+"\"}";
	}
	
}
