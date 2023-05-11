package sixteam.t6_21.controller;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

import sixteam.t6_10.securitymodel.MyUserDetailsService;
import sixteam.t6_10.securitymodel.User;
import sixteam.t6_21.model.ClassBean;
import sixteam.t6_21.model.ClassService;
import sixteam.t6_21.model.OrderBean;
import sixteam.t6_21.model.OrderItemBean;
import sixteam.t6_21.model.OrderItemService;
import sixteam.t6_21.model.OrderService;
import sixteam.t6_21.model.ShoppingCart;



@Controller
@SessionAttributes(names = {"LoginOK","ShoppingCart"})
public class OrderCrudController {
	@Autowired
	private OrderService oService;
	@Autowired
	private OrderItemService orderItemService;
	@Autowired
	private ClassService classService;
	@Autowired
	private MyUserDetailsService mService;
	
	@Secured({"ROLE_USER","ROLE_ADMIN"}) //身分驗證
	@RequestMapping(path = "/t6_21OrderMember.controller")
	public String processActionMember(Principal pc1,Model m,HttpSession session) {
		 User mb = mService.showUser(pc1.getName());
		  int memberId = mb.getId();
		 mb = (User)session.getAttribute("LoginOK");
		  if (mb == null) {
			  mb = new User();
				session.setAttribute("LoginOK", mb);   // ${ShoppingCart.subtotal} 
			}
		  
		List<OrderBean> orderList = oService.findByMemberId(memberId);
		
		m.addAttribute("orderList", orderList);
		return "t6_21/MemberOrderDetail";
	}
	
	
	
	
	
	@RequestMapping(path = "/t6_21OrderMaintain.controller")
	public String processAction(Model m) {

		List<OrderBean> orderList = oService.findAll();
		m.addAttribute("orderList", orderList);
		

		
		return "t6_21/OrderMaintainListTest";
	}
	
	//檔案匯出類型
	
	 @GetMapping(value = "/classOrderexportCsv.controller") 
	  public void exportCsv(HttpServletResponse response) throws IOException { 
	      String fileName = "output.csv";   //輸出CSV的檔案名稱 
	      response.setContentType("text/csv; charset=UTF-8");  //設定輸出為UTF-8中文才不會跑掉 
	      response.setHeader("Content-Disposition", "attachment; filename=" + fileName); 
	       
	      //這邊要改成各自的BEAN 
	      List<OrderBean> beans = oService.findAll(); 
	      try (PrintWriter writer = response.getWriter()) { 
	       //這是各位的欄位名稱 
	          writer.println("訂單編號,會員編號,會員帳號,會員信箱,會員電話,下單日期,訂單金額,付款狀態"); 
	          //這裡也要改成各位抓的值 
	          for (OrderBean bean : beans) { 
	              writer.println(bean.getOrderNumber() + "," + bean.getMemberId() + "," + bean.getMemberAccount() 
	              + ","+ bean.getMemberEmail() + "," + bean.getMemberPhone() + "," + bean.getOrderDate() + ","  
	                + bean.getOrderPrice() + "," + bean.getPaymentStatus()); 
	          } 
	      } 
	  }
	 
	 @GetMapping(value = "/classOrderexportJson.controller") 
	 public void exportJson(HttpServletResponse response) throws IOException {
		 List<OrderBean> beans = oService.findAll(); 
		 Map<Integer, Object> data = new HashMap();
		 for (OrderBean bean : beans) { 
			 data.put(bean.getOrderNumber(), bean);
			 
		 }
		    response.setContentType("application/json;charset=UTF-8");
		    response.setHeader("Content-Disposition", "attachment; filename=data.json");
		    response.getWriter().write(new ObjectMapper().writeValueAsString(data));
		  }
	 
	 //顯示後台訂單
	 @GetMapping("/oneclassorderdetail.controller/{orderNumber}")
	 @ResponseBody
	 public List<OrderItemBean> processAction1(@PathVariable("orderNumber") int orderNumber) {

				List<OrderItemBean> orderItemList = orderItemService.findByorderNumber(orderNumber);
			return orderItemList;
		}
	 
	 //訂單數量修改
	 @GetMapping("/t6_21deleteClassorder.controller/{orderNumber}")
		public String processDeleteOrderAction(@PathVariable("orderNumber") int orderNumber) {
		 List<OrderItemBean> orderItemList=orderItemService.findByorderNumber(orderNumber);
		 
		 for(OrderItemBean oib:orderItemList) {
			 int applicant = oib.getQuantity();
				int classId = oib.getClassNumber();
				classService.deleteClassApplicant(applicant,classId);
		 }
		 
		 oService.deleteByorderNumber(orderNumber);
		 orderItemService.deleteAllByOrderNumber(orderNumber);
		 return "redirect:/t6_21OrderMaintain.controller";
	 }
	 
	 @PostMapping("/addClassNewOrder.controller")
	 @ResponseBody
	 public List<ClassBean> processAddNewOrderAction() {
		 List<ClassBean> classlist = classService.findAll();
		 return classlist;
	 }
	 //更新訂單細項+更新訂單金額
	 @PostMapping("/updateOrderitem.controller")
	 @ResponseBody
	 public void updateOrder(@RequestBody List<OrderItemBean> list){
		 Double totalDouble = 0.0;
		 int ordernum = 0;
	     for(OrderItemBean oib:list) {
	         orderItemService.insert(oib);
	         Double allprice = oib.getUnitPrice();
	         ordernum = oib.getOrderNumber();
	         totalDouble += allprice;
				int applicant = oib.getQuantity();
				int classId = oib.getClassNumber();
				ClassBean cBean =classService.findById(classId);
				int originalApplicant = cBean.getClassApplicant();
				classService.updateClassApplicant(applicant-originalApplicant, classId);
	     }
	     oService.updateOrderPrice(totalDouble, ordernum);
	     System.out.println(totalDouble);
	     System.out.println(ordernum);
		 
	 }
	 //單筆項項刪除+訂單金額更新
	 @PostMapping("/t6_21deleteOrderItemDetail.controller/{seqno}")
		public String processDeleteOrderAction2(@PathVariable("seqno") int seqno) {
		 
		 OrderItemBean orderItemBean =orderItemService.findByseqno(seqno);
		 Double pricedetail = orderItemBean.getUnitPrice();
		 int ordernumber = orderItemBean.getOrderNumber();
		 int applicant = orderItemBean.getQuantity();
		 
		 
		 orderItemService.deleteByseqno(seqno);
		 oService.updateOrderPriceDetail(pricedetail, ordernumber);
		classService.deleteClassApplicant(applicant, orderItemBean.getClassNumber());

		 return "redirect:/t6_21OrderMaintain.controller";
	 }
	 
	 
		//秀出課程排序
		@GetMapping("/showOrderOrderBy.controller/{Orderorderby}")
		public String processAction3(@PathVariable("Orderorderby") int Orderorderby,Model m) {
			
			if(Orderorderby == 1) {
				List<OrderBean> orderList = oService.findByorderDateOrderByAsc();
				m.addAttribute("orderList", orderList);
				return "t6_21/OrderMaintainListTest";

			}else if(Orderorderby == 2) {
				List<OrderBean> orderList = oService.findByorderPriceByDESC();
				m.addAttribute("orderList", orderList);
				return "t6_21/OrderMaintainListTest";

			}else if(Orderorderby == 3) {
				List<OrderBean> orderList = oService.findByorderNumberOrderByAsc();
				m.addAttribute("orderList", orderList);
				return "t6_21/OrderMaintainListTest";

			}
			return null;

		}



}
