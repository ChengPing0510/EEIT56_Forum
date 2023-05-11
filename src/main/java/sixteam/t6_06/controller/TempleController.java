package sixteam.t6_06.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sixteam.t6_06.model.TempleBean;
import sixteam.t6_06.model.TempleService;
import sixteam.utils.Utils;

@Controller
public class TempleController {
		
		@Autowired
		private TempleService tService;
	
		//先改成找40內方便測試
		@Secured({"ROLE_USER","ROLE_ADMIN"})
		@RequestMapping(path = "/templeSellectAllAction")
		public String templeSellectAllAction(Model m2) {
			List<TempleBean> beans = tService.findAlltest();
			
			m2.addAttribute("tmp", beans);
			return "t6_06/SellectAll";
		}
		
		
//		---------------------------------------------------------------------------------------
		
		//透過寺廟id帶入資料新增房間
		@GetMapping("/setDatatoroom/{templeId}")
		public String frount_findtemplebyid(@PathVariable("templeId") String templeId1,Model m2,RedirectAttributes redirectAttributes) {
			int templeId = Integer.parseInt(templeId1);
			TempleBean tmpb = tService.findById(templeId);
			ArrayList<TempleBean> list = new ArrayList<TempleBean>();
			list.add(tmpb);
			m2.addAttribute("tmp", list);
			redirectAttributes.addFlashAttribute("message", tmpb);
			return "redirect:/templeRoomSellectAllAction";
		}
		
		
		//新增  
		@Secured({"ROLE_USER","ROLE_ADMIN"})
		@PostMapping("/insertTempleDataAction")
		public String insertTempleDataAction(@RequestParam("intempleName")@Nullable String templeName,@RequestParam("indeitiesName")@Nullable String deitiesName,
				   @RequestParam("inadministrative")@Nullable String administrative,@RequestParam("inaddress")@Nullable String address,
			       @RequestParam("insect")@Nullable String sect, @RequestParam("inphone")@Nullable String phone
				   , @RequestParam("inwGS84X")@Nullable Double wGS84X, @RequestParam("inwGS84Y")@Nullable Double wGS84Y) {
			TempleBean tmpb = new TempleBean();
			tmpb.setTempleName(templeName);
			tmpb.setDeitiesName(deitiesName);
			tmpb.setAdministrative(administrative);
			tmpb.setAddress(address);
			tmpb.setSect(sect);
			tmpb.setPhone(phone);
			tmpb.setWGS84X(wGS84X);
			tmpb.setWGS84Y(wGS84Y);
			tService.insert(tmpb);
			return "redirect:templeSellectAllAction";
		}
		
		//更改 
		@Secured({"ROLE_USER","ROLE_ADMIN"})
		@PostMapping("/updateTempleDataAction")
			public String updateTempleDataAction(@RequestParam("intempleId") int templeId,@RequestParam("intempleName") String templeName,@RequestParam("indeitiesName")@Nullable String deitiesName,
					   @RequestParam("inadministrative")@Nullable String administrative,@RequestParam("inaddress")@Nullable String address,
				       @RequestParam("insect")@Nullable String sect, @RequestParam("inphone")@Nullable String phone
					   , @RequestParam("inwGS84X")@Nullable Double wGS84X, @RequestParam("inwGS84Y")@Nullable Double wGS84Y) {
			
			TempleBean tmpb = new TempleBean(templeId, templeName, deitiesName, administrative, address, sect, phone, wGS84X, wGS84Y);
			tService.update(tmpb);
			return "redirect:templeSellectAllAction";
		}
				
		
		//從全部刪除
		@Secured({"ROLE_USER","ROLE_ADMIN"})
		@PostMapping("/templeDeleteActionfromall/{templeId}")
		@ResponseBody
		public String templeDeleteActionfromall(@PathVariable("templeId") int templeId) {
			tService.deleteById(templeId);
			return "OK";
		}
		
		//導出CSV
		@Secured({"ROLE_USER","ROLE_ADMIN"})
		@GetMapping(value = "/exportCsv")
		public void exportCsv(HttpServletResponse response) throws IOException {
		    String fileName = "output.csv";   //輸出CSV的檔案名稱
		    response.setContentType("text/csv; charset=UTF-8");  //設定輸出為UTF-8中文才不會跑掉
		    response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
		    
		    //這邊要改成各自的BEAN
		    List<TempleBean> beans = tService.findAlltest();
		    try (PrintWriter writer = response.getWriter()) {
		    	//這是各位的欄位名稱
		        writer.println("寺廟編號,寺廟名稱,主祀神,行政區,地址,教別,電話,X座標,Y座標");
		        //這裡也要改成各位抓的值
		        for (TempleBean bean : beans) {
		            writer.println(bean.getTempleId() + "," + bean.getTempleName() + "," + bean.getDeitiesName()
		            + ","+ bean.getAdministrative() + "," + bean.getAddress() + "," + bean.getSect() + "," 
		            		+ bean.getPhone() + "," + bean.getWGS84X()+ "," + bean.getWGS84Y());
		        }
		    }
		}

		
}
