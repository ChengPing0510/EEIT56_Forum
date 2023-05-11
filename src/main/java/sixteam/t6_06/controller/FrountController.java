package sixteam.t6_06.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.Principal;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import sixteam.t6_06.model.TempleBean;
import sixteam.t6_06.model.TempleRoomBean;
import sixteam.t6_06.model.TempleRoomOrderBean;
import sixteam.t6_06.model.TempleRoomOrderService;
import sixteam.t6_06.model.TempleRoomService;
import sixteam.t6_06.model.TempleService;
import sixteam.t6_10.securitymodel.MyUserDetailsService;
import sixteam.t6_10.securitymodel.User;
import sixteam.t6_21.model.MailService;
import sixteam.t6_21.model.OrderItemBean;
import sixteam.utils.Utils;

@Controller
@SessionAttributes(names = {"LoginOK"})
public class FrountController {
	
	@Autowired
	private TempleService tService;
	
	@Autowired
	private TempleRoomService trService;
	
	@Autowired
	private TempleRoomOrderService troService;
	
	@Autowired
	private Utils utils;
	
	@Autowired
	private MailService mservice;

	@Autowired
	private MyUserDetailsService uService;
	//抽籤
	@RequestMapping(path = "/drawstraws.controller")
	public String drawStraws(){
		return "t6_06/drawStraws";
	}	
	
	//前端找全部寺廟
	@RequestMapping(path = "/frount_findtemple.controller")
	public String frount_findtemple(Model m2){
			List<TempleBean> beans = tService.findAlltest();
			m2.addAttribute("tmp", beans);
			
	return "t6_06/frount_findtemple";
	}	
	
	//前端用ID找寺廟
	@GetMapping("/frount_findtemplebyid/{templeId}")
	public String frount_findtemplebyid(@PathVariable("templeId") String templeId1,Model m2) {
		int templeId = Integer.parseInt(templeId1);
		TempleBean tmpb = tService.findById(templeId);
		ArrayList<TempleBean> list = new ArrayList<TempleBean>();
		list.add(tmpb);
		m2.addAttribute("tmp", list);
		return "t6_06/Frount_FindTempleById";
	}
	
	//前端用寺廟ID找該廟宇所有房間
	@GetMapping("/frount_findroombytempleid/{templeId}")
	public String frount_findroombytempleid(@PathVariable("templeId") String templeId1,Model m) {
		int fk_templeId = Integer.parseInt(templeId1);
		List<TempleRoomBean> beans = trService.findByFk_templeId(fk_templeId);
		m.addAttribute("trmp", beans);
		return "t6_06/Frount_FindRoom";
	}
	
	//前端找一間房
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@GetMapping(path = "/frount_findorderroom/{roomId}")
		public String frount_findorderroom(@PathVariable("roomId") int roomId, Model m,Principal p){
		int userId = utils.getUserId(p);
		TempleRoomBean bean = trService.findById(roomId);
		String email = utils.getEmail(p);
		m.addAttribute("email",email);
		m.addAttribute("userId",userId);
		m.addAttribute("trmp",bean);
		return "t6_06/frount_orderroom";
	}	
	
	//假刪除會員訂單
	@PostMapping("/frount_orderroomdelete/{orderId}")
	public String frount_orderroomdelete(@PathVariable("orderId") int orderId,Model m)
			throws IOException, ParseException, SerialException, SQLException {
		TempleRoomOrderBean trob = troService.findByorderId(orderId);
		trob.setDeletebymember("已刪除");
		troService.update(trob);
		return "t6_06/Frount_ShowOrderById";
	}
	
	
	//存入訂單然後跳轉到那個訂單畫面
	@PostMapping("/frount_orderroom")
	public String insertTempleRoomDataAction(@RequestParam("insuserId") int userId,
			@RequestParam("insroomId") int roomId, @RequestParam("instempleName")@Nullable String templeName,
			@RequestParam("inscheckindate") String checkindate1, @RequestParam("inscheckoutdate") String checkoutdate1,
			@RequestParam("inscost") Integer cost, Model m)
			throws IOException, ParseException, SerialException, SQLException {
		// 日期轉型 先把字串轉成util Date再轉乘sql Date 原因:sql Date可以只顯示日期不含分秒
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date ucheckindate = format.parse(checkindate1);
		java.util.Date ucheckoutdate = format.parse(checkoutdate1);
		java.sql.Date checkindate = new java.sql.Date(ucheckindate.getTime());
		java.sql.Date checkoutdate = new java.sql.Date(ucheckoutdate.getTime());

		// 自動計算入住日期有幾天-之後要加入判斷
		long diff = checkoutdate.getTime() - checkindate.getTime();
		Integer numberofnights = (int) diff / (24 * 60 * 60 * 1000);
		
		//存入訂單
		String deletebymember = "未刪除";
		TempleRoomOrderBean trob = new TempleRoomOrderBean(userId, roomId, templeName, checkindate, checkoutdate,numberofnights, cost,deletebymember);
		troService.insert(trob);

		//取出訂單並計算總金額
		TempleRoomOrderBean beans = troService.findOrderList(userId);
		int totalcost = beans.getCost()*numberofnights;
		beans.setCost(totalcost);
		
		ArrayList<TempleRoomOrderBean> bean = new ArrayList<TempleRoomOrderBean>();
		bean.add(beans);
		m.addAttribute("trob",bean);
		return "t6_06/Frount_OrderList";
	}
	
	//line pay
	@GetMapping("/frount_orderroomByLinePay")
	@ResponseBody
	public String adasdfasdf(@RequestParam("JsonOrderList") String jsonData,Principal p) {
		int userId = utils.getUserId(p);
		TempleRoomOrderBean trob = troService.findOrderList(userId);
		String email1 = utils.getEmail(p);
		
		String text="<body>\r\n"
				+ "\r\n"
				+ "<p>非常感謝您使用神明便利店進行訂房!</br>\r\n"
				+ "    請確認訂單內容如下:\r\n"
				+ "</p></br>\r\n"
				+ "<p>訂單編號"+trob.getOrderId()+"sixteamOrder</p></br>\r\n"
				+ "<p>訂購人"+trob.getUserId()+"</p></br>\r\n"
				+ "<p>E-mail:"+email1+"</p></br>\r\n";
		
		text += "<p>謝謝您的購買!</p></br>\r\n"
				+"</body>";
		
//		System.out.println(text);
		String email ="teemin20230202@gmail.com";
//				utils.getEmail(p);
		mservice.prepareAndSend(email,text);
		
		
		String json = jsonData;
		String paymentUrl = null;
		try {
		    // 建立連接
		    URL url = new URL("https://sandbox-api-pay.line.me/v2/payments/request");
		    HttpURLConnection con = (HttpURLConnection) url.openConnection();
		    
		    // 設置請求方法
		    con.setRequestMethod("POST");
		    
		    // 設置header，加入Content-Type:application/json
		    con.setRequestProperty("Content-Type", "application/json");
		    con.setRequestProperty("X-LINE-ChannelId", "1657888528");
		    con.setRequestProperty("X-LINE-ChannelSecret", "82594299a8cf7e799cdf91db8b5bdd69");
		    
		    // 設置允許寫出
		    con.setDoOutput(true);
		    
		    // 寫出json數據
		    OutputStream os = con.getOutputStream();
		    byte[] input = json.getBytes("utf-8");
		    os.write(input, 0, input.length);
		    os.close();
		    
		    // 讀取伺服器返回的數據
		    BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
		    StringBuilder response = new StringBuilder();
		    String responseLine = null;
		    while ((responseLine = br.readLine()) != null) {
		        response.append(responseLine.trim());
		        String jsonStr = responseLine;
		        try {
		            ObjectMapper mapper = new ObjectMapper();
		            JsonNode root = mapper.readTree(jsonStr);
		            paymentUrl = root.path("info").path("paymentUrl").path("web").asText();
		            
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		    }
		    System.out.println(response.toString());
		} catch (Exception e) {
		    e.printStackTrace();
		}
		return paymentUrl;
		
	}
	
	//前端會員中心查詢住房訂單資訊
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@GetMapping(path = "/Frount_ShowOrderById.controller")
	public String Frount_ShowOrderById(Model m,Principal p, HttpServletRequest request, HttpSession session){
	User user = uService.showUser(p.getName());
	
	int userId = utils.getUserId(p);
	System.out.println(userId);
	String email = utils.getEmail(p);
	List<TempleRoomOrderBean> bean = troService.findOrderListAllExcept(userId);
	session.setAttribute("LoginOK", user);
	m.addAttribute("user",user);
	
	m.addAttribute("userId",userId);
	m.addAttribute("trob",bean);
	return "t6_06/Frount_ShowOrderById";
}
	
}
