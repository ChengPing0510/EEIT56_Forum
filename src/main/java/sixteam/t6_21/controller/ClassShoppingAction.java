package sixteam.t6_21.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import sixteam.t6_21.model.ClassBean;
import sixteam.t6_21.model.ClassService;
import sixteam.t6_21.model.OrderItemBean;
import sixteam.t6_21.model.ShoppingCart;


@Controller
@SessionAttributes(names = {"LoginOK","ShoppingCart"})
public class ClassShoppingAction {
	
	@Autowired
	private ClassService classService;
	
	//課程細節的加入購物車
	@PostMapping("/addToCart.controller")
	public String processAction(@RequestParam("classId") int classId,@RequestParam("qty")@Nullable Integer qty,Model m,HttpServletRequest request,HttpSession session) throws IOException {
		ShoppingCart cart = (ShoppingCart)session.getAttribute("ShoppingCart");
			if (cart == null) {
			// 就新建ShoppingCart物件
			cart = new ShoppingCart();
			// 並將此新建ShoppingCart的物件放到session物件內，成為它的屬性物件
			session.setAttribute("ShoppingCart", cart);   // ${ShoppingCart.subtotal} 
		}

			
			ClassBean cb = classService.findById(classId);
			OrderItemBean oib = new OrderItemBean(null,null,classId,cb.getDescription(),cb.getClassPrice()*qty,qty,cb.getClassPrice());
			
			List<ClassBean> classtypelist = classService.findByclassType(cb.getClassType());
			
			for(int i=0;i<classtypelist.size();i++) {
				if(cb.getClassId()  == classtypelist.get(i).getClassId()) {
					classtypelist.remove(i);
				}
			}
			m.addAttribute("classtypelist", classtypelist.subList(0, 3));
			
			cart.addToCart(classId, oib);
			System.out.println(oib.toString());
			System.out.println(cart.getContent());
			
			ClassBean cBean = classService.findById(classId);
			m.addAttribute("bean", cBean);
			return "t6_21/ClassDetail";

	}
	
	//課程列表的加入購物車
	@GetMapping("/onlyaddoneclassToCart.controller/{classId}")
	public void processAction2(@PathVariable("classId") int classId,Integer qty,Model m,HttpServletRequest request,HttpSession session) throws IOException {
		ShoppingCart cart = (ShoppingCart)session.getAttribute("ShoppingCart");
			if (cart == null) {
			// 就新建ShoppingCart物件
			cart = new ShoppingCart();
//			log.info("加入購物車之Controller: 新建ShoppingCart物件");
			// 並將此新建ShoppingCart的物件放到session物件內，成為它的屬性物件
			session.setAttribute("ShoppingCart", cart);   // ${ShoppingCart.subtotal} 
		}

			qty = 1;
			ClassBean cb = classService.findById(classId);
			OrderItemBean oib = new OrderItemBean(null,null,classId,cb.getDescription(),cb.getClassPrice()*qty,qty,cb.getClassPrice());
			
			cart.addToCart(classId, oib);
			System.out.println(oib.toString());
			System.out.println(cart.getContent());
	}
	
	
	@GetMapping("/showshoppingcart.controller")
	public String processMainAction(HttpServletRequest request,HttpSession session,Model m) {
		
		ShoppingCart sc =(ShoppingCart)session.getAttribute("ShoppingCart");
		if(sc == null) {
			return"t6_21/emptyShoppingCart";
		}
		List<ClassBean> list = classService.findAll();
		List newlistList = new ArrayList<>();
		if(list.size()>2) {
			newlistList = list.subList(0, 3);	
		}
				
		
		
		m.addAttribute("list", newlistList);
		return "t6_21/ShoppingCartContent";
	}
	
	@GetMapping("/deleteshoppingitem.controller/{classId}")
	public String deleleshoppingitem(@PathVariable("classId") int classId,HttpServletRequest request,HttpSession session) {
		ShoppingCart sc= (ShoppingCart)session.getAttribute("ShoppingCart");
		if (sc == null) {
			return "redirect:/showAllClass.controller";
		}
		sc.deleteClass(classId);
		return "redirect:/showshoppingcart.controller";
	}
	
	@GetMapping("/abandonshopping.controller")
	public String abandonshopping(HttpServletRequest request,SessionStatus sessionStatus,HttpSession session) {
		ShoppingCart sc= (ShoppingCart)session.getAttribute("ShoppingCart");
		if (sc != null) {
			session.removeAttribute("ShoppingCart");
			sessionStatus.setComplete();
		}
		
		
		return "redirect:/showAllClass.controller";
	}
	@PostMapping("/updateshoppingqty.controller/{classId}")
	public String updateCartItem(@PathVariable("classId") int classId,@RequestParam("newQty") int newQty,HttpServletRequest request,HttpSession session) {
		ShoppingCart sc= (ShoppingCart)session.getAttribute("ShoppingCart");
		if (sc == null) {
			return "redirect:/showAllClass.controller";
		}
		sc.modifyQty(classId, newQty); 
		return "redirect:/showAllClass.controller";
		
	}

}
