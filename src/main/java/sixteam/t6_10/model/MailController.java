package sixteam.t6_10.model;

import java.sql.SQLException;
import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import sixteam.t6_10.securitymodel.MyUserDetailsService;
import sixteam.t6_21.model.MailService;


@Controller
public class MailController {

	@Autowired
	private MailService mailService;
	
	@Autowired
	private MyUserDetailsService uService;
	
	 public String verification(){


	        StringBuilder str = new StringBuilder();
	        Random random = new Random();
	        for (int i = 0; i < 6; i++) {
	            str.append(random.nextInt(10));
	        }
//	        return str.toString();
	        return new BCryptPasswordEncoder().encode(str).toString();
	
	    }
	
		@PostMapping(path = "/checkAccountEmail.controller",produces="application/json;charset=UTF-8")
		@ResponseBody
		public String processAction(@RequestParam("username") String username,@RequestParam("email") String email) {
			System.out.println("進入checkAccountEmail.controller");
			try {
				boolean check = uService.checkaccountnumberemail(username, email);
				System.out.println(check);
				if(check) {
					return "OK";
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return "xx";
		}
	 
	//寄送信件
	@PostMapping("/sendmailforverify.controller")
	@ResponseBody
	public String processSendMail(@RequestParam("email")String email) throws MessagingException {
		String verification = verification();
		String htmltext = "<body>\r\n"
				+ "    <div class=\"card\" style=\"width: 25rem;position: relative;\r\n"
//				+ "    display: flex;\r\n"
				+ "    flex-direction: column;\r\n"
				+ "    min-width: 0;\r\n"
				+ "    word-wrap: break-word;\r\n"
				+ "    background-color: #fff;\r\n"
				+ "    background-clip: border-box;\r\n"
				+ "    border: 1px solid rgba(0,0,0,.125);\r\n"
				+ "    border-radius: 0.25rem;\">\r\n"
				+ "        <img src=\"https://times.hinet.net/news/cimages/admin/16e3bed67a90000066be.jpg\"\r\n"
				+ "            class=\"card-img-top\" alt=\"...\" width=\"100%\">\r\n"
				+ "        <div class=\"card-body\" style=\"margin-bottom: 0.5rem;\">\r\n"
				+ "            <h2 class=\"card-title\" style=\"text-align: center;\">您的驗證碼為</h2>\r\n"
				+ "            <h1 class=\"card-text\"  style=\"text-align: center;\">"+verification+"\r\n"
				+ "                </h1>\r\n"
				+ "        </div>\r\n"
				+ "    </div>\r\n"
				+ "</body>";
		mailService.sendMail(email, "【神明便利店】會員驗證碼", htmltext);
		return verification;
	}
	

}
