package sixteam.t6_21.controller;

import java.security.Principal;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import sixteam.t6_10.securitymodel.MyUserDetailsService;
import sixteam.t6_10.securitymodel.RegistDate;
import sixteam.t6_10.securitymodel.RegistDateService;
import sixteam.t6_10.securitymodel.User;
import sixteam.t6_14.model.ActiveService;
import sixteam.t6_14.model.Actives;
import sixteam.t6_21.model.ClassBean;
import sixteam.t6_21.model.ClassService;
import sixteam.t6_21.model.OrderBean;
import sixteam.t6_21.model.OrderService;
import sixteam.t6_27.model.PostBean;
import sixteam.t6_27.model.PostService;

@Controller
@SessionAttributes(names = { "LoginOK" })
public class t6indexController {

	@Autowired
	private ClassService classService;

	@Autowired
	private MyUserDetailsService uService;

	@Autowired
	private RegistDateService rService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private ActiveService activesService;

	@Autowired
	private PostService pService;

	@RequestMapping("/welcomeToIndex")
	public String processAction(Model m) {
		List<ClassBean> classlist = classService.findAll();
		m.addAttribute("classList", classlist);
		List<Actives> actives = activesService.findAll();
		Collections.shuffle(actives);
		m.addAttribute("actives", actives.subList(0, 1));

//		  PostBean pBean = pService.findById(1004);
//		  m.addAttribute("post", pBean);
//		  
//		  PostBean pBean1 = pService.findById(1005);
//		  m.addAttribute("post1", pBean1);

//		  PostBean pBean = pService.findById(1);
//		  m.addAttribute("post", pBean);

		return "front_index";
	}

	@Secured({ "ROLE_ADMIN" }) // 先開都可登 之後刪
	@RequestMapping("/toBackIndex")
	public String toBackIndex(Model m) {
		long count = uService.showCount();
		m.addAttribute("count", count);

		List<OrderBean> orderlist = orderService.findAll();

		int totalprice = 0;

		for (OrderBean orderBean : orderlist) {

			double price = orderBean.getOrderPrice();

			totalprice += (int) price;
		}

		long countclass = orderService.showCount();
		m.addAttribute("countclass", countclass);
		m.addAttribute("totalprice", totalprice);

		return "index-background";
	}

	@Secured({ "ROLE_ADMIN", "ROLE_USER" })
	@RequestMapping("/loginToIndex")
	public String loginToIndex(Principal pc1, Model m, HttpServletRequest request, HttpSession session) {
		User user = uService.showUser(pc1.getName());
		session.setAttribute("LoginOK", user);

		List<ClassBean> classlist = classService.findAll();
		m.addAttribute("classList", classlist);
		List<Actives> actives = activesService.findAll();
		Collections.shuffle(actives);
		m.addAttribute("actives", actives.subList(0, 4));

		return "front_index";
	}

	@Secured({ "ROLE_ADMIN", "ROLE_USER" })
	@RequestMapping("/loginToProfile")
	public String loginToProfile(Principal pc1, Model m, HttpServletRequest request, HttpSession session) {
		User user = uService.showUser(pc1.getName());
		RegistDate registDate = rService.addUser(user.getId());
		m.addAttribute("registDate", registDate);
		session.setAttribute("LoginOK", user);
		m.addAttribute("user", user);
		return "t6_10/profile";
	}

}
