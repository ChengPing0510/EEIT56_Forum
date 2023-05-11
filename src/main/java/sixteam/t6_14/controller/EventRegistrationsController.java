package sixteam.t6_14.controller;

import java.math.BigDecimal;
import java.security.Principal;
import java.util.List;

import javax.mail.MessagingException;
import javax.transaction.Transactional;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import sixteam.t6_10.model.MyAuthenticationProvider;
import sixteam.t6_10.securitymodel.MyUserDetails;
import sixteam.t6_10.securitymodel.MyUserDetailsService;
import sixteam.t6_10.securitymodel.User;
import sixteam.t6_10.securitymodel.UserRepository;
import sixteam.t6_14.model.Actives;
import sixteam.t6_14.model.ActivesRepository;
import sixteam.t6_14.model.ActivesServiceImpl;
import sixteam.t6_14.model.EventRegistService;
import sixteam.t6_14.model.EventRegistrations;
import sixteam.t6_14.model.EventRegistrationsRepository;
import sixteam.t6_21.model.MailService;
import sixteam.utils.Utils;

@Controller
@SessionAttributes(names = {"LoginOK"})
@RequestMapping("/EventRegist")
public class EventRegistrationsController {

	@Autowired
	private MailService mailService;
	@Autowired
	private EventRegistService eventRegistService;
	@Autowired
	private MyUserDetailsService userDetailsService;
	@Autowired
	private ActivesServiceImpl actService;
	@Autowired
	private Utils utils;
	
	@Transactional
	@PreAuthorize("isAuthenticated()")
	  @PostMapping("/register/{id}")
	public String showEventRegist(@PathVariable Integer id,Model m,Principal p1,@RequestParam("email") String email,
			@RequestParam("name") String name,@RequestParam("phone") String phone,String recipient,String subject,String body) throws MessagingException {
		Actives actives=actService.findById(id);
		User user=userDetailsService.showUser(p1.getName());
		int memberid=user.getId();
		User users= userDetailsService.showUser(memberid);
		EventRegistrations result=new EventRegistrations(name,email,phone,actives,users);
		eventRegistService.save(result);
		actives.setActiveParticipantNum(actives.getActiveParticipantNum()-1);
		actives.setActiveSignUpNumber(actives.getActiveSignUpNumber()+1);
		actService.save(actives);
		m.addAttribute("active",actives);
		
		
		String emailText="<div class=\"nH aHU\" style=\"-webkit-text-stroke-width:0px;color:rgb(32, 33, 36);font-family:&quot;Google Sans&quot;, Roboto, RobotoDraft, Helvetica, Arial, sans-serif;font-size:medium;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;orphans:2;position:relative;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\r\n"
				+ "    <div class=\"nH hx\" style=\"background-color:transparent;color:rgb(34, 34, 34);min-width:502px;padding:0px;\">\r\n"
				+ "        <div class=\"nH\" jslog=\"20686; u014N:xr6bB\" role=\"list\">\r\n"
				+ "            <div class=\"h7 ie nH oy8Mbf\" style=\"clear:both;max-width:100000px;outline:none;padding-bottom:0px;\" role=\"listitem\" aria-expanded=\"true\" tabindex=\"-1\">\r\n"
				+ "                <div class=\"Bk\" style=\"border-bottom-color:initial;border-bottom-style:initial;border-image:initial;border-left-color:initial;border-left-style:initial;border-radius:0px;border-right-color:initial;border-right-style:initial;border-top-color:rgb(239, 239, 239);border-top-style:solid;border-width:0px;float:left;margin-bottom:0px;position:relative;width:1192px;\">\r\n"
				+ "                    <div class=\"G3 G2\" style=\"background-color:transparent;border-bottom-color:rgba(100, 121, 143, 0.12);border-bottom-width:0px;border-image:initial;border-left-width:0px;border-radius:0px;border-right-width:0px;border-top-style:none;margin-bottom:0px;margin-left:0px;margin-right:0px;padding-top:0px;\">\r\n"
				+ "                        <div>\r\n"
				+ "                            <div id=\":1h1\">\r\n"
				+ "                                <div class=\"adn ads\" style=\"border-left-style:none;display:flex;padding:0px;\" data-message-id=\"#msg-f:1739483736244703524\" data-legacy-message-id=\"1823e33def6f5124\">\r\n"
				+ "                                    <div class=\"gs\" style=\"margin:0px;padding:0px 0px 20px;width:1120px;\">\r\n"
				+ "                                        <div class=\"\">\r\n"
				+ "                                            <div class=\"aHl\" style=\"margin-left:-38px;\">\r\n"
				+ "                                                &nbsp;\r\n"
				+ "                                            </div>\r\n"
				+ "                                            <div class=\"ii gt\" style=\"direction:ltr;font-size:0.875rem;margin:8px 0px 0px;padding:0px;position:relative;\" id=\":1i4\" jslog=\"20277; u014N:xr6bB; 4:W251bGwsbnVsbCxbXV0.\">\r\n"
				+ "                                                <div class=\"a3s aiL \" style=\"font:small / 1.5 Arial, Helvetica, sans-serif;overflow:hidden;\" id=\":1gz\">\r\n"
				+ "                                                    <div style=\"margin:0px;\">\r\n"
				+ "                                                        <div>\r\n"
				+ "                                                            <figure class=\"table\" style=\"width:1120px;\">\r\n"
				+ "                                                                <table style=\"background-color:rgb(243, 243, 243);border-collapse:collapse !important;line-height:2;margin:0px;padding:40px 20px;\" cellpadding=\"0\" cellspacing=\"0\">\r\n"
				+ "                                                                    <tbody>\r\n"
				+ "                                                                        <tr>\r\n"
				+ "                                                                            <td style=\"border-collapse:collapse !important;font-family:&quot;Noto Sans JP&quot;, &quot;Microsoft JhengHei&quot;, Helvetica, Arial, PingFang, 黑體-繁, 微軟正黑體, sans-serif;margin:0px;\">\r\n"
				+ "                                                                                <figure class=\"table\" style=\"width:1120px;\">\r\n"
				+ "                                                                                    <table style=\"border-collapse:collapse !important;\" cellpadding=\"0\" cellspacing=\"0\">\r\n"
				+ "                                                                                        <tbody>\r\n"
				+ "                                                                                            <tr>\r\n"
				+ "                                                                                                <td style=\"border-left:30px solid transparent;margin:0px;padding-top:30px;\">\r\n"
				+ "                                                                                                    <p style=\"text-align:center;\">\r\n"
				+ "                                                                                                        <img class=\"image_resized\" style=\"width:50%;\" src=\"https://i.imgur.com/iUsG2ou.png\">\r\n"
				+ "                                                                                                    </p>\r\n"
				+ "                                                                                                </td>\r\n"
				+ "                                                                                            </tr>\r\n"
				+ "                                                                                            <tr>\r\n"
				+ "                                                                                                <td style=\"margin:0px;\">\r\n"
				+ "                                                                                                    &nbsp;\r\n"
				+ "                                                                                                </td>\r\n"
				+ "                                                                                            </tr>\r\n"
				+ "                                                                                        </tbody>\r\n"
				+ "                                                                                    </table>\r\n"
				+ "                                                                                </figure>\r\n"
				+ "                                                                                <figure class=\"table\" style=\"width:600px;\">\r\n"
				+ "                                                                                    <table style=\"border-collapse:collapse !important;color:rgb(102, 102, 102);margin-left:auto;margin-right:auto;\" cellpadding=\"0\" cellspacing=\"0\">\r\n"
				+ "                                                                                        <tbody>\r\n"
				+ "                                                                                            <tr>\r\n"
				+ "                                                                                                <td style=\"border-collapse:collapse !important;margin:0px;padding-bottom:25px;width:560px;\">\r\n"
				+ "                                                                                                    <p>\r\n"
				+ "                                                                                                        <span style=\"color:hsl(0,0%,0%);font-size:14px;\">"+name+ "您好</span>\r\n"
				+ "                                                                                                    </p>\r\n"
				+ "                                                                                                    <p>\r\n"
				+ "                                                                                                        <span style=\"color:hsl(0,0%,0%);font-family:Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:14px;\"><span style=\"-webkit-text-stroke-width:0px;display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:pre-wrap;widows:2;word-spacing:0px;\">感謝您對神明便利店的支持。我們很高興通知您，您的報名已經成功。</span></span>\r\n"
				+ "                                                                                                    </p>\r\n"
				+ "                                                                                                    <p>\r\n"
				+ "                                                                                                        <span style=\"color:hsl(0,0%,0%);font-size:14px;\">提醒您，請在24小時內完成繳費，以利活動名額的保障</span>\r\n"
				+ "                                                                                                    </p>\r\n"
				+ "                                                                                                    <p>\r\n"
				+ "                                                                                                        <span style=\"color:hsl(0,0%,0%);font-size:14px;\">謝謝</span>\r\n"
				+ "                                                                                                    </p>\r\n"
				+ "                                                                                                    <p style=\"text-align:center;\">\r\n"
				+ "                                                                                                        &nbsp;\r\n"
				+ "                                                                                                    </p>\r\n"
				+ "                                                                                                    <figure class=\"table\">\r\n"
				+ "                                                                                                        <table style=\"background-color:rgb(243, 243, 243);border:1px solid rgb(102, 102, 102);\">\r\n"
				+ "                                                                                                            <tbody>\r\n"
				+ "                                                                                                                <tr>\r\n"
				+ "                                                                                                                    <td style=\"margin:0px;\">\r\n"
				+ "                                                                                                                        <figure class=\"table\">\r\n"
				+ "                                                                                                                            <table style=\"background-color:rgb(243, 243, 243);margin:0px auto;\" width=\"600px\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
				+ "                                                                                                                                <tbody>\r\n"
				+ "                                                                                                                                    <tr style=\"background-color:rgb(243, 243, 243);\">\r\n"
				+ "                                                                                                                                        <td style=\"margin:0px;\">\r\n"
				+ "                                                                                                                                            <figure class=\"table\">\r\n"
				+ "                                                                                                                                                <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
				+ "                                                                                                                                                    <tbody>\r\n"
				+ "                                                                                                                                                        <tr>\r\n"
				+ "                                                                                                                                                            <td style=\"margin:0px;\" width=\"5%\" height=\"0\">\r\n"
				+ "                                                                                                                                                                &nbsp;\r\n"
				+ "                                                                                                                                                            </td>\r\n"
				+ "                                                                                                                                                            <td style=\"margin:0px;\">\r\n"
				+ "                                                                                                                                                                &nbsp;\r\n"
				+ "                                                                                                                                                            </td>\r\n"
				+ "                                                                                                                                                            <td style=\"margin:0px;\" width=\"5%\">\r\n"
				+ "                                                                                                                                                                &nbsp;\r\n"
				+ "                                                                                                                                                            </td>\r\n"
				+ "                                                                                                                                                        </tr>\r\n"
				+ "                                                                                                                                                        <tr>\r\n"
				+ "                                                                                                                                                            <td style=\"margin:0px;\">\r\n"
				+ "                                                                                                                                                                &nbsp;\r\n"
				+ "                                                                                                                                                            </td>\r\n"
				+ "                                                                                                                                                            <td style=\"margin:0px;width:600px;\">\r\n"
				+ "                                                                                                                                                                <figure class=\"table\">\r\n"
				+ "                                                                                                                                                                    <table style=\"background-color:rgb(243, 243, 243);margin:0px auto;\" width=\"520px\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
				+ "                                                                                                                                                                        <tbody>\r\n"
				+ "                                                                                                                                                                            <tr>\r\n"
				+ "                                                                                                                                                                                <td style=\"display:flex;height:30px;margin:0px;padding-bottom:20px;padding-top:20px;width:520px;\">\r\n"
				+ "                                                                                                                                                                                    <p>\r\n"
				+ "                                                                                                                                                                                        &nbsp;\r\n"
				+ "                                                                                                                                                                                    </p>\r\n"
				+ "                                                                                                                                                                                    <p>\r\n"
				+ "                                                                                                                                                                                        <span style=\"color:hsl(0, 0%, 0%);font-size:18px;\"><strong>您的報名資訊如下：</strong></span>\r\n"
				+ "                                                                                                                                                                                    </p>\r\n"
				+ "                                                                                                                                                                                </td>\r\n"
				+ "                                                                                                                                                                            </tr>\r\n"
				+ "                                                                                                                                                                        </tbody>\r\n"
				+ "                                                                                                                                                                    </table>\r\n"
				+ "                                                                                                                                                                </figure>\r\n"
				+ "                                                                                                                                                            </td>\r\n"
				+ "                                                                                                                                                            <td style=\"margin:0px;\">\r\n"
				+ "                                                                                                                                                                &nbsp;\r\n"
				+ "                                                                                                                                                            </td>\r\n"
				+ "                                                                                                                                                        </tr>\r\n"
				+ "                                                                                                                                                        <tr>\r\n"
				+ "                                                                                                                                                            <td style=\"margin:0px;\">\r\n"
				+ "                                                                                                                                                                &nbsp;\r\n"
				+ "                                                                                                                                                            </td>\r\n"
				+ "                                                                                                                                                            <td style=\"margin:0px;width:600px;\">\r\n"
				+ "                                                                                                                                                                <figure class=\"table\">\r\n"
				+ "                                                                                                                                                                    <table style=\"background-color:rgb(243, 243, 243);margin:0px auto;\" width=\"520px\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
				+ "                                                                                                                                                                        <tbody>\r\n"
				+ "                                                                                                                                                                            <tr>\r\n"
				+ "                                                                                                                                                                                <td style=\"border-bottom:2px solid rgb(221, 221, 221);border-top:2px solid rgb(221, 221, 221);color:rgb(57, 57, 57);display:flex;font-family:&quot;Noto Sans JP&quot;, &quot;Microsoft JhengHei&quot;, Helvetica, Arial, PingFang, 黑體-繁, 微軟正黑體, sans-serif;font-size:16px;font-weight:500;margin:0px;padding-bottom:20px;padding-top:20px;width:520px;\">\r\n"
				+ "                                                                                                                                                                                    <span style=\"display:block;text-align:left;width:520px;\">活動資訊</span>\r\n"
				+ "                                                                                                                                                                                </td>\r\n"
				+ "                                                                                                                                                                            </tr>\r\n"
				+ "                                                                                                                                                                        </tbody>\r\n"
				+ "                                                                                                                                                                    </table>\r\n"
				+ "                                                                                                                                                                </figure>\r\n"
				+ "                                                                                                                                                            </td>\r\n"
				+ "                                                                                                                                                            <td style=\"margin:0px;\">\r\n"
				+ "                                                                                                                                                                &nbsp;\r\n"
				+ "                                                                                                                                                            </td>\r\n"
				+ "                                                                                                                                                        </tr>\r\n"
				+ "                                                                                                                                                        <tr>\r\n"
				+ "                                                                                                                                                            <td style=\"margin:0px;\">\r\n"
				+ "                                                                                                                                                                &nbsp;\r\n"
				+ "                                                                                                                                                            </td>\r\n"
				+ "                                                                                                                                                            <td style=\"margin:0px;width:600px;\">\r\n"
				+ "                                                                                                                                                                <figure class=\"table\">\r\n"
				+ "                                                                                                                                                                    <table style=\"background-color:rgb(243, 243, 243);margin:0px auto;\" width=\"520px\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
				+ "                                                                                                                                                                        <tbody>\r\n"
				+ "                                                                                                                                                                            <tr>\r\n"
				+ "                                                                                                                                                                                <td style=\"color:rgb(102, 102, 102);display:flex;font-family:&quot;Noto Sans JP&quot;, &quot;Microsoft JhengHei&quot;, Helvetica, Arial, PingFang, 黑體-繁, 微軟正黑體, sans-serif;font-size:14px;margin:0px;padding-top:20px;\">\r\n"
				+ "                                                                                                                                                                                    <span style=\"display:block;margin-right:auto;text-align:left;width:260px;\">活動名稱：</span><a href=\"http://localhost:8081/actives/actdesview/"+actives.getActiveID()+"\"><span style=\"display:block;margin-left:auto;text-align:right;width:260px;\">"+actives.getActiveName()+"</span></a>\r\n"
				+ "                                                                                                                                                                                </td>\r\n"
				+ "                                                                                                                                                                            </tr>\r\n"
				+ "                                                                                                                                                                        </tbody>\r\n"
				+ "                                                                                                                                                                    </table>\r\n"
				+ "                                                                                                                                                                </figure>\r\n"
				+ "                                                                                                                                                            </td>\r\n"
				+ "                                                                                                                                                            <td style=\"margin:0px;\">\r\n"
				+ "                                                                                                                                                                &nbsp;\r\n"
				+ "                                                                                                                                                            </td>\r\n"
				+ "                                                                                                                                                        </tr>\r\n"
				+ "                                                                                                                                                        <tr>\r\n"
				+ "                                                                                                                                                            <td style=\"margin:0px;\">\r\n"
				+ "                                                                                                                                                                &nbsp;\r\n"
				+ "                                                                                                                                                            </td>\r\n"
				+ "                                                                                                                                                            <td style=\"margin:0px;width:600px;\">\r\n"
				+ "                                                                                                                                                                <figure class=\"table\">\r\n"
				+ "                                                                                                                                                                    <table style=\"background-color:rgb(243, 243, 243);margin:0px auto;\" width=\"520px\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
				+ "                                                                                                                                                                        <tbody>\r\n"
				+ "                                                                                                                                                                            <tr>\r\n"
				+ "                                                                                                                                                                                <td style=\"color:rgb(102, 102, 102);display:flex;font-family:&quot;Noto Sans JP&quot;, &quot;Microsoft JhengHei&quot;, Helvetica, Arial, PingFang, 黑體-繁, 微軟正黑體, sans-serif;font-size:14px;margin:0px;\">\r\n"
				+ "                                                                                                                                                                                    <span style=\"display:block;margin-right:auto;text-align:left;width:260px;\">活動時間：</span><span style=\"display:block;margin-left:auto;text-align:right;width:260px;\">"+actives.getActiveStartDate()+"-"+actives.getActiveEndDate()+"</span></a>\r\n"
				+ "                                                                                                                                                                                </td>\r\n"
				+ "                                                                                                                                                                            </tr>\r\n"
				+ "                                                                                                                                                                        </tbody>\r\n"
				+ "                                                                                                                                                                    </table>\r\n"
				+ "                                                                                                                                                                </figure>\r\n"
				+ "                                                                                                                                                            </td>\r\n"
				+ "                                                                                                                                                            <td style=\"margin:0px;\">\r\n"
				+ "                                                                                                                                                                &nbsp;\r\n"
				+ "                                                                                                                                                            </td>\r\n"
				+ "                                                                                                                                                        </tr>\r\n"
				+ "                                                                                                                                                        <tr>\r\n"
				+ "                                                                                                                                                            <td style=\"margin:0px;\">\r\n"
				+ "                                                                                                                                                                &nbsp;\r\n"
				+ "                                                                                                                                                            </td>\r\n"
				+ "                                                                                                                                                            <td style=\"margin:0px;width:600px;\">\r\n"
				+ "                                                                                                                                                                <figure class=\"table\">\r\n"
				+ "                                                                                                                                                                    <table style=\"background-color:rgb(243, 243, 243);margin:0px auto;\" width=\"520px\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
				+ "                                                                                                                                                                        <tbody>\r\n"
				+ "                                                                                                                                                                            <tr>\r\n"
				+ "                                                                                                                                                                                <td style=\"color:rgb(102, 102, 102);display:flex;font-family:&quot;Noto Sans JP&quot;, &quot;Microsoft JhengHei&quot;, Helvetica, Arial, PingFang, 黑體-繁, 微軟正黑體, sans-serif;font-size:14px;margin:0px;padding-bottom:20px;\">\r\n"
				+ "                                                                                                                                                                                    <span style=\"display:block;margin-right:auto;text-align:left;width:260px;\">活動地點：</span><span style=\"display:block;margin-left:auto;text-align:right;width:260px;\">"+actives.getActiveLocation()+"</span>\r\n"
				+ "                                                                                                                                                                                </td>\r\n"
				+ "                                                                                                                                                                            </tr>\r\n"
				+ "                                                                                                                                                                        </tbody>\r\n"
				+ "                                                                                                                                                                    </table>\r\n"
				+ "                                                                                                                                                                </figure>\r\n"
				+ "                                                                                                                                                            </td>\r\n"
				+ "                                                                                                                                                            <td style=\"margin:0px;\">\r\n"
				+ "                                                                                                                                                                &nbsp;\r\n"
				+ "                                                                                                                                                            </td>\r\n"
				+ "                                                                                                                                                        </tr>\r\n"
				+ "                                                                                                                                                    </tbody>\r\n"
				+ "                                                                                                                                                </table>\r\n"
				+ "                                                                                                                                            </figure>\r\n"
				+ "                                                                                                                                        </td>\r\n"
				+ "                                                                                                                                    </tr>\r\n"
				+ "                                                                                                                                </tbody>\r\n"
				+ "                                                                                                                            </table>\r\n"
				+ "                                                                                                                        </figure>\r\n"
				+ "                                                                                                                    </td>\r\n"
				+ "                                                                                                                </tr>\r\n"
				+ "                                                                                                            </tbody>\r\n"
				+ "                                                                                                        </table>\r\n"
				+ "                                                                                                    </figure>\r\n"
				+ "                                                                                                    <figure class=\"table\">\r\n"
				+ "                                                                                                        <table>\r\n"
				+ "                                                                                                            <tbody>\r\n"
				+ "                                                                                                                <tr>\r\n"
				+ "                                                                                                                    <td style=\"margin:0px;\">\r\n"
				+ "                                                                                                                        <figure class=\"table\">\r\n"
				+ "                                                                                                                            <table style=\"margin:0px auto;\" width=\"600px\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
				+ "                                                                                                                                <tbody>\r\n"
				+ "                                                                                                                                    <tr>\r\n"
				+ "                                                                                                                                        <td style=\"margin:0px;\">\r\n"
				+ "                                                                                                                                            <figure class=\"table\">\r\n"
				+ "                                                                                                                                                <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
				+ "                                                                                                                                                    <tbody>\r\n"
				+ "                                                                                                                                                        <tr>\r\n"
				+ "                                                                                                                                                            <td style=\"color:rgb(224, 59, 87);font-family:&quot;Noto Sans JP&quot;, &quot;Microsoft JhengHei&quot;, Helvetica, Arial, PingFang, 黑體-繁, 微軟正黑體, sans-serif;font-size:14px;margin:0px;padding-top:20px;\">\r\n"
				+ "                                                                                                                                                                <span style=\"display:block;margin-left:auto;margin-right:auto;width:365px;\">這是系統發出的電子郵件，請勿直接回覆，感謝您的配合！</span>\r\n"
				+ "                                                                                                                                                            </td>\r\n"
				+ "                                                                                                                                                        </tr>\r\n"
				+ "                                                                                                                                                        <tr>\r\n"
				+ "                                                                                                                                                            <td style=\"color:rgb(102, 102, 102);font-family:&quot;Noto Sans JP&quot;, &quot;Microsoft JhengHei&quot;, Helvetica, Arial, PingFang, 黑體-繁, 微軟正黑體, sans-serif;font-size:14px;margin:0px;\">\r\n"
				+ "                                                                                                                                                                <span style=\"display:block;margin-left:auto;margin-right:auto;width:230px;\">若您有任何問題，請立即與我們聯繫</span>\r\n"
				+ "                                                                                                                                                            </td>\r\n"
				+ "                                                                                                                                                        </tr>\r\n"
				+ "                                                                                                                                                        <tr>\r\n"
				+ "                                                                                                                                                            <td style=\"color:rgb(102, 102, 102);font-family:&quot;Noto Sans JP&quot;, &quot;Microsoft JhengHei&quot;, Helvetica, Arial, PingFang, 黑體-繁, 微軟正黑體, sans-serif;font-size:14px;margin:0px;\">\r\n"
				+ "                                                                                                                                                                <a style=\"color:rgb(17, 85, 204);\" href=\"mailto:iservice@ispan.com.tw?subject=%E5%BD%A9%E8%99%B9%E7%89%A7%E5%A0%B4RainbowFUN+-+%E9%A1%A7%E5%AE%A2%E6%84%8F%E8%A6%8B\" target=\"_blank\"><span style=\"display:block;margin-left:auto;margin-right:auto;width:155px;\">GOD@666.com.tw</span></a>\r\n"
				+ "                                                                                                                                                            </td>\r\n"
				+ "                                                                                                                                                        </tr>\r\n"
				+ "                                                                                                                                                        <tr>\r\n"
				+ "                                                                                                                                                            <td style=\"color:rgb(102, 102, 102);font-family:&quot;Noto Sans JP&quot;, &quot;Microsoft JhengHei&quot;, Helvetica, Arial, PingFang, 黑體-繁, 微軟正黑體, sans-serif;font-size:14px;margin:0px;\">\r\n"
				+ "                                                                                                                                                                <span style=\"display:block;margin-left:auto;margin-right:auto;width:345px;\">或致電神明便利店有限公司 服務專線 666-666</span>\r\n"
				+ "                                                                                                                                                            </td>\r\n"
				+ "                                                                                                                                                        </tr>\r\n"
				+ "                                                                                                                                                        <tr>\r\n"
				+ "                                                                                                                                                            <td style=\"color:rgb(102, 102, 102);font-family:&quot;Noto Sans JP&quot;, &quot;Microsoft JhengHei&quot;, Helvetica, Arial, PingFang, 黑體-繁, 微軟正黑體, sans-serif;font-size:14px;margin:0px;\">\r\n"
				+ "                                                                                                                                                                <span style=\"display:block;margin-left:auto;margin-right:auto;width:155px;\">服務時間 : 09:00 ~ 17:00</span>\r\n"
				+ "                                                                                                                                                            </td>\r\n"
				+ "                                                                                                                                                        </tr>\r\n"
				+ "                                                                                                                                                        <tr>\r\n"
				+ "                                                                                                                                                            <td style=\"color:rgb(102, 102, 102);font-family:&quot;Noto Sans JP&quot;, &quot;Microsoft JhengHei&quot;, Helvetica, Arial, PingFang, 黑體-繁, 微軟正黑體, sans-serif;font-size:14px;margin:0px;padding-bottom:20px;\">\r\n"
				+ "                                                                                                                                                                <span style=\"display:block;margin-left:auto;margin-right:auto;width:330px;\">GOD International Inc. © 2023 All Rights Reserved</span>\r\n"
				+ "                                                                                                                                                            </td>\r\n"
				+ "                                                                                                                                                        </tr>\r\n"
				+ "                                                                                                                                                    </tbody>\r\n"
				+ "                                                                                                                                                </table>\r\n"
				+ "                                                                                                                                            </figure>\r\n"
				+ "                                                                                                                                        </td>\r\n"
				+ "                                                                                                                                    </tr>\r\n"
				+ "                                                                                                                                </tbody>\r\n"
				+ "                                                                                                                            </table>\r\n"
				+ "                                                                                                                        </figure>\r\n"
				+ "                                                                                                                    </td>\r\n"
				+ "                                                                                                                </tr>\r\n"
				+ "                                                                                                            </tbody>\r\n"
				+ "                                                                                                        </table>\r\n"
				+ "                                                                                                    </figure>\r\n"
				+ "                                                                                                </td>\r\n"
				+ "                                                                                            </tr>\r\n"
				+ "                                                                                        </tbody>\r\n"
				+ "                                                                                    </table>\r\n"
				+ "                                                                                </figure>\r\n"
				+ "                                                                            </td>\r\n"
				+ "                                                                        </tr>\r\n"
				+ "                                                                    </tbody>\r\n"
				+ "                                                                </table>\r\n"
				+ "                                                            </figure>\r\n"
				+ "                                                        </div>\r\n"
				+ "                                                    </div>\r\n"
				+ "                                                </div>\r\n"
				+ "                                            </div>\r\n"
				+ "                                        </div>\r\n"
				+ "                                    </div>\r\n"
				+ "                                </div>\r\n"
				+ "                            </div>\r\n"
				+ "                        </div>\r\n"
				+ "                    </div>\r\n"
				+ "                </div>\r\n"
				+ "            </div>\r\n"
				+ "        </div>\r\n"
				+ "    </div>\r\n"
				+ "</div>";
		
		
		mailService.sendMail(email, "【神明便利店】"+actives.getActiveName()+"活動報名通知", emailText);
		return"t6_14/enrollcomplete";
		
	
	}
	//跳轉到活動報名頁面
	@Secured({"ROLE_USER"})
	@GetMapping("/{eventid}")
	public String toEventRegistView(@PathVariable("eventid") Integer id,Model m,Principal p ) {
		Actives actives=actService.findById(id);
		String username=utils.getName(p);
		m.addAttribute("act", actives);
		m.addAttribute("username",username);
		return"t6_14/activeenroll";
		
	}
	@ResponseBody
	@GetMapping("/checkSignUp/{eventid}")
	public Boolean checkSignUp(@PathVariable("eventid")   Integer id) {
		return actService.isSignUpAllowed(id);
	}
	
	@Secured({"ROLE_USER"})
	@GetMapping
	public String findEnrolled(Principal p,Model m){
		int userid=utils.getUserId(p);
		List<Actives> enrollerAct=eventRegistService.findEnrolled(userid);
		m.addAttribute("actives",enrollerAct);
		return"t6_14/enrolledactives";
	}
	@ResponseBody
	@GetMapping("/find")
	public List<Actives> findAllByUserId() {
		return eventRegistService.findAllByUserId(1007);
	}
	
	@ResponseBody
	@GetMapping("/ar/{activeId}")
	public List<EventRegistrations> finEventRegistrations(@PathVariable("activeId") Integer activeId){
		return eventRegistService.findAllByActiveId(activeId);
	}
	
	
}
