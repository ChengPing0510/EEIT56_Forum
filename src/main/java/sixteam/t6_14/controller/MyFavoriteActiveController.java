package sixteam.t6_14.controller;

import java.security.Principal;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import sixteam.t6_10.securitymodel.MyUserDetailsService;
import sixteam.t6_10.securitymodel.User;
import sixteam.t6_14.model.ActiveService;
import sixteam.t6_14.model.Actives;
import sixteam.t6_14.model.MyFavoriteActives;
import sixteam.utils.Utils;
import sixteam.t6_14.model.MyFavoriteActiveService;

@Controller
@SessionAttributes(names = {"LoginOK"})

@RequestMapping("/favorite")
public class MyFavoriteActiveController {
	@Autowired
	private ActiveService activeService;
	@Autowired
	private MyUserDetailsService userService;
	@Autowired
	private MyFavoriteActiveService favActiveService;
	@Autowired
	private Utils utils;
	
	
	@PostMapping("/add/{activeId}")
	@ResponseBody
	@Transactional
	public String addToFav(Principal principal ,@PathVariable Integer activeId) {
		if (principal == null) {
		    return "no";
		  }

		User user=userService.showUser(principal.getName());
		Timestamp addTime=new Timestamp(System.currentTimeMillis());
		Actives actives=activeService.findById(activeId);
		// 防止重複的最愛活動被新增
		MyFavoriteActives checkFav=favActiveService.findByUserAndActive(user,actives);
		if(checkFav!=null) {
			return "已加入最愛，無需重複加入";
		}
		MyFavoriteActives favActive=new MyFavoriteActives(user,actives,addTime);
		favActiveService.save(favActive);
		return"ok";
	}
	@ResponseBody
	@DeleteMapping("/del/{activeid}")
	public void deleteFav(@PathVariable("activeid") Integer activeId,Principal p) {
		Actives actives=activeService.findById(activeId);
		User user=userService.showUser(p.getName());


		favActiveService.deleteFav(user,actives);
	}
	@ResponseBody
	@GetMapping("/check/{activeID}")
	public boolean checkFavActive(Principal principal, @PathVariable Integer activeID) {
		if (principal == null) {
		    return false;
		  }
	  User user = userService.showUser(principal.getName());
	  Actives actives = activeService.findById(activeID);
	  MyFavoriteActives checkFav = favActiveService.findByUserAndActive(user, actives);
	  return checkFav != null;
	}
	@Secured({"ROLE_USER"})
	@GetMapping
	public String findAllFavActives(Model model,Principal p) {
		int userid=utils.getUserId(p);
		List<Actives> favActives= favActiveService.findAllFavActives(userid);
		model.addAttribute("actives", favActives);
		
		return"t6_14/myfavactive";

	}
	@GetMapping("/count/{activeId}")
	@ResponseBody
	public Integer favCountByActive(@PathVariable("activeId") Integer activeId) {
		return favActiveService.countFavoriteByActiveID(activeId);
	}
	
	


}
