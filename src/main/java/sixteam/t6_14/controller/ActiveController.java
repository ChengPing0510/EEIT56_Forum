package sixteam.t6_14.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;
import org.apache.commons.io.IOUtils;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import sixteam.t6_14.model.ActiveService;
import sixteam.t6_14.model.Actives;
import sixteam.t6_14.model.EventRegistService;
import sixteam.t6_14.model.EventRegistrations;

//@RestController
@Controller
@SessionAttributes(names = {"LoginOK"})
@RequestMapping("/actives")
//@MultipartConfig
public class ActiveController {

	@Autowired
	private ActiveService activeService;
	@Autowired
	private EventRegistService eventRegistService;

	@PostMapping
	public String save(@RequestParam("name") String name, @RequestParam("img") MultipartFile mf,
			@RequestParam("description") String description, @RequestParam("start") Date start,
			@RequestParam("end") Date end, @RequestParam("location") String location, @RequestParam("host") String host,
			@RequestParam("num") Integer participantNum ,@RequestParam("price") BigDecimal price,@RequestParam("signUpNum") Integer signUpNum) throws IOException {
		System.out.println("------------");
		String fileName = mf.getOriginalFilename();

		byte[] b = mf.getBytes();
		if (fileName != null && fileName.length() != 0) {
			Actives actives = new Actives(name, b, description, start, end, location, host,participantNum,price,signUpNum);
			activeService.save(actives);
		}
		return "redirect:/actives";

	}

//	@GetMapping("/del/{id}")
//	public ModelAndView delete(@PathVariable Integer id, ModelAndView mav) {
//
//		activeService.delete(id);
//		mav.setViewName("redirect:/actives");
//		return mav;
//
//	}

	@PostMapping("/update")
	public String update(@RequestParam("id") Integer id, @RequestParam("name") String name,
			@RequestParam("img") MultipartFile mf, @RequestParam("description") String description,
			@RequestParam("start") Date start, @RequestParam("end") Date end, @RequestParam("location") String location,
			@RequestParam("host") String host,@RequestParam("num") Integer participantNum ,@RequestParam("price") BigDecimal price,
			@RequestParam("signUpNum") Integer signUpNum) throws IOException {
		String fileName = mf.getOriginalFilename();
		byte[] b = mf.getBytes();
		if (fileName != null && fileName.length() != 0) {
		Actives actives = new Actives(id, name, b, description, start, end, location, host,participantNum,price,signUpNum);
		activeService.update(actives);}
		return "redirect:/actives";

	}

	@GetMapping
	public String findAll(Model model) {
		List<Actives> actives = activeService.findAll();
		model.addAttribute("actives", actives);
		return "t6_14/mainactive";
	}
	//後臺活動報名
	@GetMapping("/toenroll/{activeId}")
	public String backEnroll(Model model,@PathVariable("activeId") Integer activeId) {
		Actives active = activeService.findById(activeId);
		List<EventRegistrations> eventRegistrations=eventRegistService.findAllByActiveId(activeId);
		model.addAttribute("active", active);
		model.addAttribute("enrollinfo",eventRegistrations);
		return "t6_14/backenrolled";
	}

//讀圖片
	@GetMapping("/toImg/{activeID}")
	@ResponseBody
	public byte[] toImg(@PathVariable("activeID") int activeID, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Actives actives = activeService.findById(activeID);
		byte[] picturebyte = actives.getActiveImg();
		InputStream is = new ByteArrayInputStream(picturebyte);

		return IOUtils.toByteArray(is);

	}

//跳轉到修改頁面的jsp
	@GetMapping("/updateView/{activeID}")
	public String toUpdateAddView(@PathVariable("activeID") Integer activeID, Model model) {
		Actives result = activeService.findById(activeID);
		model.addAttribute("act", result);
		return "t6_14/activeupdate";
	}

//跳轉道新增頁面的jsp
	@GetMapping("/addView")
	public String toAddView() {
		return "t6_14/addactive";
	}
	//跳轉到主頁的jsp
	@GetMapping("/actview")
	public String toindex(Model model) {
		List<Actives> actives = activeService.findAll();
		List<Actives> top3Actives= activeService.findByTopThrNum();
		model.addAttribute("actives", actives);
		model.addAttribute("top3", top3Actives);
		return"t6_14/newactive";
	}
	//跳轉到活動描述的jsp  
	@GetMapping("/actdesview/{activeID}")
	public String todes(Model model ,@PathVariable("activeID") Integer id) {
		Actives result = activeService.findById(id);
		model.addAttribute("act", result);
		return "t6_14/actives";
	}
	
	@ResponseBody
	@GetMapping("/top")
	public List<Actives> imgTopThree() {
		return activeService.findByTopThrNum();
	}
	
	//匯出csv
	
	  @GetMapping(value = "/exportCsv") 
	  public void exportCsv(HttpServletResponse response) throws IOException { 
	      String fileName = "active.csv";   //輸出CSV的檔案名稱 
	      response.setContentType("text/csv; charset=UTF-8");  //設定輸出為UTF-8中文才不會跑掉 
	      response.setHeader("Content-Disposition", "attachment; filename=" + fileName); 
	       
	      //這邊要改成各自的BEAN 
	      List<Actives> beans = activeService.findAll(); 
	      try (PrintWriter writer = response.getWriter()) { 
	       //這是各位的欄位名稱 
	          writer.println("活動編號,活動名稱,活動圖片,活動描述,開始時間,結束時間,活動地點,主辦單位,人數上限,報名人數,價格"); 
	          //這裡也要改成各位抓的值 
	          for (Actives active : beans) { 
	              writer.println(active.getActiveID() + "," + active.getActiveName()+ "," + active.getActiveImg() 
	              + ","+ active.getActiveDescription() + "," + active.getActiveStartDate() + "," + active.getActiveEndDate() + ","  
	                + active.getActiveLocation() + "," + active.getActiveHost()+ "," + active.getActiveParticipantNum()+ "," + active.getActiveSignUpNumber()+ "," + active.getActivePrice()); 
	          } 
	      } 
	  }
	
//轉json
//@PostMapping
//public Actives save(@RequestBody Actives active) {
//
//	Actives result = activeService.save(active);
//	return result;
//
//}
@DeleteMapping("/{id}")
@ResponseBody
public void delete(@PathVariable Integer id) {

	activeService.delete(id);
	
}}
//@PutMapping
//public Actives update(@RequestBody Actives active) {
//
//	Actives result = activeService.update(active);
//	return result;
//
//}
//@GetMapping
//public List<Actives> findAll() {
//	List<Actives> active = activeService.findAll();
//	return active;
//}
//@GetMapping("/{id}")
//public Actives findById(@PathVariable Integer id) {
//	Actives active = activeService.findById(id);
//	return active;
//}}

//crud