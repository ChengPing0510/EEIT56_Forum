package sixteam.t6_21.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import sixteam.t6_10.securitymodel.MyUserDetailsService;
import sixteam.t6_10.securitymodel.User;
import sixteam.t6_21.model.ClassService;
import sixteam.t6_21.model.MailService;
import sixteam.t6_21.model.OrderBean;
import sixteam.t6_21.model.OrderItemBean;
import sixteam.t6_21.model.OrderItemService;
import sixteam.t6_21.model.OrderService;
import sixteam.t6_21.model.ShoppingCart;

@Controller
@SessionAttributes(names = {"LoginOK","ShoppingCart"})
public class ClassProcessOrder {

	@Autowired
	private OrderService oService;
	@Autowired
	private MyUserDetailsService mService;
	@Autowired
	private OrderItemService orService;
	@Autowired
	private MailService mailService;
	@Autowired
	private ClassService cService;
	
	AllInOne all = new AllInOne("");
	AioCheckOutALL obj = new AioCheckOutALL();
	
	@Secured({"ROLE_USER","ROLE_ADMIN"}) //身分驗證
	@PostMapping("/orderConfirm.controller")
	public String processAction(Principal pc1,HttpServletRequest request, SessionStatus sessionStatus, Model m,HttpSession session) {

		
		String id = obj.getMerchantTradeNo();
		id = id.replace("NewSixTest", "");
		int orderNumber = Integer.parseInt(id);
		System.out.println(orderNumber);
		OrderBean obBean = oService.findByorderNumber(orderNumber);
		oService.updatePaymentStatus(orderNumber);
		m.addAttribute("bean", obBean);
		
		int memberId =obBean.getMemberId();
		System.out.println(memberId);
		
		User mbBean = mService.showUser(pc1.getName());

		
		System.out.println(mbBean.toString());		
		
		ShoppingCart sc= (ShoppingCart)session.getAttribute("ShoppingCart");
		User memberBean =  (User) session.getAttribute("LoginOK");
		
		System.out.println("session到底有沒有啦!!!!!");
		System.out.println(sc);
		System.out.println(memberBean);
		
		if (sc != null) {
			session.removeAttribute("ShoppingCart");
			sessionStatus.setComplete();
		}
		
		if (memberBean == null) {
			memberBean = new User();
				session.setAttribute("LoginOK", memberBean);   
			}
		
		List<OrderItemBean> oib = orService.findByorderNumber(orderNumber);
		m.addAttribute("orderItem", oib);
		
		return "t6_21/OrderSuccess";
	}
	
	@RequestMapping("/TEST")
	public String checkout() {
		
		return "t6_21/ttest";
		
	}

	
	@Secured({"ROLE_USER","ROLE_ADMIN"}) //身分驗證
	@PostMapping("/payment/checkout")
	@ResponseBody
	public String checkout(Principal pc1,HttpServletRequest request, HttpServletResponse response,@RequestParam("memberAccount") String memberAccount,
			@RequestParam("memberEmail") String memberEmail, @RequestParam("memberPhone") String memberPhone,HttpSession session) throws Exception {
		
		//先insert進資料庫(訂單跟訂單細項)
		User memberBean = (User) session.getAttribute("LoginOK");
		ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("ShoppingCart");
		Double orderPrice = shoppingCart.getSubtotal();
	
		User mb = mService.showUser(pc1.getName());
		int memberId = mb.getId();
		Date today = new Date();

		// insert進單筆訂單
		OrderBean orderBean = new OrderBean(memberId, memberAccount, memberEmail, memberPhone, today, orderPrice);
		System.out.println(orderBean);
		oService.insert(orderBean);

		int OrderNumber = orderBean.getOrderNumber();
		System.out.println(OrderNumber);
		// 取得到訂單號碼

		// insert進訂單細項的資料表
		Map<Integer, OrderItemBean> content = shoppingCart.getContent();
		// insert進訂單細項
		Collection<OrderItemBean> values = content.values();
		
		for (OrderItemBean oib : values) {
			oib.setOrderNumber(OrderNumber);
			orService.insert(oib);
			int applicant = oib.getQuantity();
			int classId = oib.getClassNumber();
			cService.updateClassApplicant(applicant, classId);
		}
		
		System.out.println("=======================");
		System.out.println(orderBean);
		System.out.println(content);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String nowTime = sdf.format(today);
		
		String mail ="<figure style=\"width:26.45%;\">\r\n"
				+ "    <p>\r\n"
				+ " <img style=\"width:50%\" src=\"https://ci3.googleusercontent.com/proxy/PHEtSbroP_NX7P9k5oGKvnhSFg6YYRjSgXqAM0ireT2-zj0Ci5StH0qL1wcUao4xLQk=s0-d-e1-ft#https://i.imgur.com/iUsG2ou.png\" class=\"CToWUd a6T\" data-bit=\"iit\" tabindex=\"0\">\r\n"
				+ "    </p>\r\n"
				+ "    <div class=\"a6S\" style=\"left:761px;opacity:0.01;top:554px;\" dir=\"ltr\">\r\n"
				+ "        <div class=\"T-I J-J5-Ji aQv T-I-ax7 L3 a5q\" id=\":pg\" role=\"button\" tabindex=\"0\" aria-label=\"下載附件「」\" jslog=\"91252; u014N:cOuCgd,Kr2w4b,xr6bB\" data-tooltip-class=\"a1V\" data-tooltip=\"下載\">\r\n"
				+ "            <div class=\"akn\">\r\n"
				+ "                <div class=\"aSK J-J5-Ji aYr\">\r\n"
				+ "                    &nbsp;\r\n"
				+ "                </div>\r\n"
				+ "            </div>\r\n"
				+ "        </div>\r\n"
				+ "    </div>\r\n"
				+ "</figure>\r\n"
				+ "<div style=\"border-bottom:1px solid rgb(204, 204, 204);clear:both;font-family:Helvetica,Arial,sans-serif;height:1px;\">\r\n"
				+ "    &nbsp;\r\n"
				+ "</div>\r\n"
				+ "<p>\r\n"
				+ "    <br>\r\n"
				+ "    &nbsp;\r\n"
				+ "</p>\r\n"
				+ "<p style=\"color:rgb(28,37,56);font-family:Helvetica,Arial,sans-serif;font-size:18px;line-height:24px;\">\r\n"
				+ "    <strong>[神明便利店] 訂單成功通知&nbsp;</strong>\r\n"
				+ "</p>\r\n"
				+ "<p style=\"font-family:Helvetica,Arial,sans-serif;\">\r\n"
				+ "    訂單日期\r\n"
				+ nowTime +"\r\n"
				+ "</p>\r\n"
				+ "<div style=\"color:rgb(85,85,85);font-family:Helvetica,Arial,sans-serif;font-size:14px;margin-bottom:15px;\">\r\n"
				+ "</div>\r\n"
				+ "<div style=\"color:rgb(51,51,51);font-family:Helvetica,Arial,sans-serif;font-size:12px;margin-bottom:5px;text-transform:uppercase;\">\r\n"
				+ "    訂單號碼\r\n"
				+ "sixteamOrder"+OrderNumber+"\r\n"
				+ "</div>\r\n"
				+ "<div style=\"color:rgb(85,85,85);font-family:Helvetica,Arial,sans-serif;font-size:14px;margin-bottom:15px;\">\r\n"
				+ "</div>\r\n"
				+ "<div style=\"color:rgb(51,51,51);font-family:Helvetica,Arial,sans-serif;font-size:12px;margin-bottom:5px;text-transform:uppercase;\">\r\n"
				+ "    訂單狀態\r\n"
				+ "</div>\r\n"
				+ "<div style=\"color:rgb(85,85,85);font-family:Helvetica,Arial,sans-serif;font-size:14px;margin-bottom:15px;\">\r\n"
				+ "    已成立\r\n"
				+ "</div>\r\n"
				+ "<div style=\"color:rgb(51,51,51);font-family:Helvetica,Arial,sans-serif;font-size:12px;margin-bottom:5px;text-transform:uppercase;\">\r\n"
				+ "    &nbsp;\r\n"
				+ "</div>\r\n"
				+ "<div style=\"color:rgb(51,51,51);font-family:Helvetica,Arial,sans-serif;font-size:12px;margin-bottom:5px;text-transform:uppercase;\">\r\n"
				+ "    訂購人\r\n"
				+ "</div>\r\n"
				+ "<div style=\"color:rgb(85,85,85);font-family:Helvetica,Arial,sans-serif;font-size:14px;margin-bottom:15px;\">\r\n"
				+ memberAccount+"&nbsp;\r\n"
				+ "</div>\r\n"
				+ "<div style=\"color:rgb(51,51,51);font-family:Helvetica,Arial,sans-serif;font-size:12px;margin-bottom:5px;text-transform:uppercase;\">\r\n"
				+ "    電話號碼\r\n"
				+ "</div>\r\n"
				+ "<div style=\"color:rgb(85,85,85);font-family:Helvetica,Arial,sans-serif;font-size:14px;margin-bottom:15px;\">\r\n"
				+memberPhone +"\r\n"
				+ "</div>\r\n"
				+ "<div style=\"color:rgb(51,51,51);font-family:Helvetica,Arial,sans-serif;font-size:12px;margin-bottom:5px;text-transform:uppercase;\">\r\n"
				+ "    電子信箱\r\n"
				+ "</div>\r\n"
				+ "<div style=\"color:rgb(85,85,85);font-family:Helvetica,Arial,sans-serif;font-size:14px;margin-bottom:15px;\">\r\n"
				+ "    <a href=\"mailto:teemin20230202@gmail.com\" target=\"_blank\">"
				+ memberEmail+"\r\n"
				+ "</div>\r\n"
				+ "<div style=\"color:rgb(85,85,85);font-family:Helvetica,Arial,sans-serif;font-size:14px;margin-bottom:5px;\">\r\n"
				+ "    &nbsp;\r\n"
				+ "</div>\r\n"
				+ "<div style=\"color:rgb(51,51,51);font-family:Helvetica,Arial,sans-serif;font-size:12px;margin-bottom:5px;text-transform:uppercase;\">\r\n"
				+ "    訂單詳情\r\n"
				+ "</div>\r\n"
				+ "<figure style=\"width:100.6%;\">\r\n"
				+ "    <figure class=\"table\" style=\"width:100%;\">\r\n"
				+ "        <table class=\"ck-table-resized\" style=\"border-spacing:0px;color:rgb(51,51,51);font-family:Helvetica,Arial,sans-serif;font-size:12px;\">\r\n"
				+ "            <colgroup><col style=\"width:78.62%;\"><col style=\"width:21.38%;\"></colgroup>\r\n"
				+ "            <tbody style=\"font-family:Helvetica,Arial,sans-serif;\">\r\n"
				+ "";
				
				
		for (OrderItemBean oib : values) {
			mail+= "                <tr style=\"font-family:Helvetica,Arial,sans-serif;\">\r\n"
					+ "                    <td style=\"border-collapse:collapse;font-family:Helvetica,Arial,sans-serif;margin:0px;\">\r\n"
					+ "                        <p>\r\n"
					+ "                            <span style=\"background-color:rgb(255,255,255);color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:small;\"><span style=\"display:inline!important;float:none;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">"
					+oib.getDescription()
					+ "</span></span>\r\n"
					+ "                        </p>\r\n"
					+ "                        <p>\r\n"
					+ "                            <span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);font-family:Helvetica,Arial,sans-serif;font-size:12px;\"><span style=\"display:inline!important;float:none;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">"
					+ oib.getQuantity()+"x"+oib.getClassPrice()
					+ "</span></span>\r\n"
					+ "                        </p>\r\n"
					+ "                    </td>\r\n"
					+ "                    <td style=\"border-collapse:collapse;font-family:Helvetica,Arial,sans-serif;margin:0px;vertical-align:top;\">\r\n"
					+ "                        <p style=\"text-align:right;\">\r\n"
					+ oib.getQuantity()*oib.getClassPrice()
					+ "\r\n"
					+ "                        </p>\r\n"
					+ "                    </td>\r\n"
					+ "                </tr>\r\n";
		}
					
				
				
		mail += "  <tr style=\"font-family:Helvetica,Arial,sans-serif;\">\r\n"
				+ "                    <td style=\"border-collapse:collapse;color:rgb(51,51,51);font-family:Helvetica,Arial,sans-serif;font-size:12px;margin:0px;padding-bottom:10px;text-align:right;text-transform:uppercase;\">\r\n"
				+ "                        合計:\r\n"
				+ "                    </td>\r\n"
				+ "                    <td style=\"border-collapse:collapse;color:rgb(85,85,85);font-family:Helvetica,Arial,sans-serif;font-size:12px;margin:0px;padding-bottom:10px;padding-left:16px;text-align:right;white-space:nowrap;\">\r\n"
				+ "NT"+ shoppingCart.getSubtotal()
				+ "\r\n"
				+ "                    </td>\r\n"
				+ "                </tr>\r\n"
				+ "            </tbody>\r\n"
				+ "        </table>\r\n"
				+ "    </figure>\r\n"
				+ "</figure>\r\n"
				+ "<p>\r\n"
				+ "    <br>";
		
		mailService.prepareAndSend(memberEmail,mail);
		System.out.println("寄信成功");
		
		
		obj.setMerchantTradeNo("NewSixTest"+OrderNumber);
		obj.setMerchantTradeDate("2017/01/01 08:05:23");
		obj.setTotalAmount(String.valueOf(Math.round(shoppingCart.getSubtotal())));
		obj.setTradeDesc("test Description");
		obj.setItemName("神明便利店課程");
		obj.setReturnURL("http://localhost:8081/test/checkout");
		obj.setChoosePayment("Credit");
		obj.setOrderResultURL("http://localhost:8081/orderConfirm.controller");
		obj.setNeedExtraPaidInfo("N");
		String form = all.aioCheckOut(obj, null);
		return form;
	}
}
