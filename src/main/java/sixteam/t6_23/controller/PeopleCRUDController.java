package sixteam.t6_23.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import sixteam.t6_23.model.people.PeopleBean_23;
import sixteam.t6_23.model.people.PeopleService;
import sixteam.t6_23.model.people.PeopleServiceImpl;

@Controller
@RequestMapping("/t6_23")
@SessionAttributes(names = { "totalPages", "tota;Elements" ,"LoginOK"})
public class PeopleCRUDController {

	@Autowired
	private PeopleService pService;
	

	public PeopleCRUDController() {
		this.pService = new PeopleServiceImpl();
	}

	@GetMapping("/test1.controller")
	public String processPeopleActionTest() {
		return "t6_23/showPeopleTest";
	}

	@GetMapping("/selectaction.controller2")
	public String processMainAction2(Model m) {
		List<PeopleBean_23> beans = pService.findAll();
		m.addAttribute("peopleBeans", beans);
		return "t6_23/ShowUserSelect";
	}

	@PostMapping("/userselect.controller")
	public String showUserSelect(@RequestParam("userId") String userName, Model m) {
		List<PeopleBean_23> bean;
		if (userName.equals("")) {
			bean = pService.findAll();

		} else {
			bean = pService.findByNameLike(userName);
		}
		m.addAttribute("peopleBeans", bean);
		return "t6_23/ShowUserSelect";
	}


	@PostMapping("/queryByPage/{pageNo}")
	@ResponseBody
	public List<PeopleBean_23> processQueryByPageAction(@PathVariable("pageNo") int pageNo, Model m) {
		int pageSize = 5;
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Page<PeopleBean_23> page = pService.findAllByPage(pageable);

		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());

		return page.getContent();
	}
	
	@PostMapping("/queryAndDeleteByPage/{pageNo}")
	@ResponseBody
	public List<PeopleBean_23> processSearchAndDeleteByPageAction(@PathVariable("pageNo") int pageNo, Model m) {
		int pageSize = 5;
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Page<PeopleBean_23> page = pService.findAllByPage(pageable);
		
		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		
		return page.getContent();
	}

	@PostMapping("/userselect.controller/{page}")
	@ResponseBody
	public List<PeopleBean_23> showUserSelectQueryByPage(@RequestParam("pname") @Nullable String name,
			@PathVariable("page") int page, Model m) {
		List<PeopleBean_23> result;
		System.out.println("1=----------------------->" + name);
		if (name == null) {
			result = pService.findAll();
		} else {
			result = pService.findByNameLike(name);
		}
		System.out.println("2=----------------------->" + name);
		int size = (int) Math.ceil((double) result.size());
		int pageSize = 5;
		int start = (page - 1) * pageSize;
		int end = start + pageSize;
		if (end > result.size()) {
			end = result.size();
		}
		result = result.subList(start, end);

		if (size % pageSize == 0) {
			m.addAttribute("totalPages", size / pageSize);
		} else {

			m.addAttribute("totalPages", size / pageSize + 1);
		}
		return result;
	}
	
	@PostMapping("/queryAndDeleteByPage.controller/{page}")
	@ResponseBody
	public List<PeopleBean_23> processSearchAndDeleteByPageAction(@RequestParam("pname") @Nullable String name,
			@PathVariable("page") int page, Model m) {
		List<PeopleBean_23> result;
		System.out.println("1=----------------------->" + name);
		if (name == null) {
			result = pService.findAll();
		} else {
			result = pService.findByNameLike(name);
		}
		System.out.println("2=----------------------->" + name);
		int size = (int) Math.ceil((double) result.size());
		int pageSize = 5;
		int start = (page - 1) * pageSize;
		int end = start + pageSize;
		if (end > result.size()) {
			end = result.size();
		}
		result = result.subList(start, end);
		
		if (size % pageSize == 0) {
			m.addAttribute("totalPages", size / pageSize);
		} else {
			
			m.addAttribute("totalPages", size / pageSize + 1);
		}
		return result;
	}

	@GetMapping("/showallpeople.do")
	public String ShowAllPeople(Model m) {
		List<PeopleBean_23> beans = pService.findAll();
		m.addAttribute("peopleBeans", beans);
		return "t6_23/ShowPeople";
	}
	
	@GetMapping("/showallpeople2.do")
	public String ShowAllPeople2(Model m) {
		
		return "t6_23/searchAndDelete";
	}
	
	

	@GetMapping("/showupdatepeopleform.controller/{id}")
	public String ShowUpdatePeopleController(@PathVariable("id") Integer id, Model m) {
		PeopleBean_23 bean = pService.findById(id);
		m.addAttribute("bean", bean);
		return "t6_23/ShowUpdatePeopleForm";
	}

	@GetMapping("/showpeople.controller")
	public String ShowPeopleController(@RequestParam("id") Integer id, Model m) {
		PeopleBean_23 bean = pService.findById(id);
		m.addAttribute("bean", bean);
		return "t6_23/ShowUserSelectForm";
	}

	@GetMapping("/removePeople.controller/{id}")
	public String DeletePeopleController(@PathVariable("id") Integer id, Model m) {
		pService.deleteById(id);

		List<PeopleBean_23> beans = pService.findAll();
		m.addAttribute("peopleBeans", beans);
		return "t6_23/ShowPeople";
	}

	@PostMapping("/removePeople2.controller/{id}")
	@ResponseBody
	public String DeletePeopleController(@PathVariable("id") Integer id) {
		pService.deleteById(id);
		return "刪除成功";
	}

	@GetMapping(path = "/toImages", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public byte[] processButeArrayImageAction(@RequestParam("id") Integer id, HttpServletRequest request)
			throws IOException {
		PeopleBean_23 bean = pService.findById(id);
		byte[] images = bean.getImages();
		ByteArrayInputStream in = new ByteArrayInputStream(images);
//		InputStream in = request.getServletContext().getResourceAsStream("/WEB-INF/resources/images/t6_23/"+images);
		return IOUtils.toByteArray(in);
	}

	@GetMapping("/insertPeopleForm.controller")
	public String processToInsertForm() {
		return "t6_23/InsertPeopleForm_23";
	}

	@PostMapping("/processpeople.controller")
	public String InsertPeopleController(@RequestParam("userId") String userid, @RequestParam("name") String name,
			@RequestParam("age") String age, @RequestParam("photo") @Nullable MultipartFile mf,
			@RequestParam("gender") String sex, @RequestParam("city") String city, @RequestParam("place") String place,
			@RequestParam("star_sign") String star, @RequestParam("profession") String profession,
			@RequestParam("religion") String religion, @RequestParam("income") String income,
			@RequestParam("sex_in") @Nullable String sex_in, @RequestParam("hobby") String hobby,
			@RequestParam("dream") String dream, @RequestParam("personality") String personality,
			@RequestParam("emotion") String emotion, @RequestParam("introduction") String introduction, Model m)
			throws IOException, ServletException, SQLException {
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		PeopleBean_23 pb = new PeopleBean_23();

		if (userid == null || userid.length() == 0) {
			errors.put("eid", "帳號不能為空");
		} else {
			boolean isNumeric = false;
			for (int i = 0; i < userid.length(); i++) {
				if (!Character.isDigit(userid.charAt(i))) {
					isNumeric = true;
				}
			}
			if (isNumeric) {
				errors.put("eid", "帳號只能為整數數字");
			}else {
				pb.setUserid(Integer.valueOf(userid));
			}
		}

		if (name == null || name.length() == 0) {
			errors.put("ename", "暱稱不能為空");
		}
		

		if (age == null || age.length() == 0) {
			errors.put("eage", "年齡不能為空");
		} else {
			boolean isNumeric = false;
			for (int i = 0; i < age.length(); i++) {
				if (!Character.isDigit(age.charAt(i))) {
					isNumeric = true;
				}
			}
			if (isNumeric) {
				errors.put("eage", "年齡只能為整數數字");
			}else {
				pb.setAge(Integer.valueOf(age));
			}
		}
		
		if (sex == null || sex.length() == 0) {
			errors.put("egender", "請勾選一個選項");
		}
		String address;
		address = city + place;
		
		if (address == null || address.length() == 0) {
			errors.put("eaddress", "地址請選擇縣市區");
		}
		Double userincome = null;
		

		String fileName = mf.getOriginalFilename();

		byte[] b = mf.getBytes();
		if (fileName != null && fileName.length() != 0) {
			pb.setImages(b);
		}

		
		pb.setName(name);
		pb.setSex(sex);
		pb.setAddress(address);
		pb.setStar(star);
		pb.setEmotion(emotion);
		pb.setProfession(profession);
		pb.setPersonality(personality);
		pb.setHobby(hobby);
		pb.setDream(dream);
		pb.setIntroduction(introduction);
		pb.setReligion(religion);
		pb.setSex_in(sex_in);
		System.out.println("------------------");
		
		if(!income.equals("")) {
			try {
				System.out.println("0---------------------------->"+"\""+income+"\"");
				userincome = Double.valueOf(income);
			} catch ( NumberFormatException e) {
				errors.put("eincome", "只能輸入數字");
				m.addAttribute("bean", pb);
				System.out.println("1------------------------->income is error");
				return "t6_23/InsertPeopleForm_23";
			} 
		}		
		pb.setIncome(userincome);
		
		if(errors!=null && !errors.isEmpty()) {
			System.out.println("2--------------------------->something roung");
			m.addAttribute("bean", pb);
			return "t6_23/InsertPeopleForm_23";
		}
		
		PeopleBean_23 bean = pService.findById(Integer.valueOf(userid));
		if(bean==null) {
			pService.insert(pb);
			
			m.addAttribute("peopleBean", pb);
			return "t6_23/InsertPeopleSuccess";
		}
		
		errors.put("eid", "該帳號已註冊帳號");
		m.addAttribute("bean", pb);
		System.out.println("3----------------------------->該帳號已註冊帳號");
		return "t6_23/InsertPeopleForm_23";
	}

	@PostMapping("/updatePeople.controller")
	public String UpdatePeopleController(@RequestParam("userId") Integer userid,
			@RequestParam("name") String name, @RequestParam("age") String age,
			@RequestParam("photo") MultipartFile mf, @RequestParam("address") String address,
			@RequestParam("star_sign") String star, @RequestParam("profession") String profession,
			@RequestParam("religion") String religion, @RequestParam("income") @Nullable String income,
			@RequestParam("sex_in") @Nullable String sex_in, @RequestParam("hobby") String hobby,
			@RequestParam("dream") String dream, @RequestParam("personality") String personality,
			@RequestParam("emotion") String emotion, @RequestParam("introduction") String introduction, Model m)
			throws IllegalStateException, IOException {
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		PeopleBean_23 pb = new PeopleBean_23();

		if (name == null || name.length() == 0) {
			errors.put("ename", "暱稱不能為空");
		}

		if (age == null || age.length() == 0) {
			errors.put("eage", "年齡不能為空");
		} else {
			boolean isNumeric = false;
			for (int i = 0; i < age.length(); i++) {
				if (!Character.isDigit(age.charAt(i))) {
					isNumeric = true;
				}
			}
			if (isNumeric) {
				errors.put("eage", "年齡只能為整數數字");
			}else {
				pb.setAge(Integer.valueOf(age));
			}
		}
		
		if (address == null || address.length() == 0) {
			errors.put("eaddress", "地址請輸入縣市區");
		}
		Double userincome = null;
		
		
		PeopleBean_23 bean = pService.findById(userid);
		String fileName = mf.getOriginalFilename();
		byte[] b = mf.getBytes();

		if (fileName != null && fileName.length() != 0) {
			pb.setImages(b);
		} else {
			pb.setImages(bean.getImages());
		}

		pb.setUserid(userid);
		pb.setName(name);
		
		pb.setAddress(address);
		pb.setStar(star);
		pb.setEmotion(emotion);
		pb.setProfession(profession);
		pb.setPersonality(personality);
		pb.setHobby(hobby);
		pb.setDream(dream);
		pb.setIntroduction(introduction);
		pb.setReligion(religion);
		pb.setSex_in(sex_in);
		pb.setSex(bean.getSex());
		
		if(!income.equals("")) {
			try {
				System.out.println("0---------------------------->"+"\""+income+"\"");
				userincome = Double.valueOf(income);
			} catch ( NumberFormatException e) {
				errors.put("eincome", "只能輸入數字");
				m.addAttribute("bean", pb);
				System.out.println("1------------------------->income is error");
				return "t6_23/ShowUpdatePeopleForm";
			} 
		}		
		pb.setIncome(userincome);

		pService.update(pb);

		List<PeopleBean_23> beans = pService.findAll();
		m.addAttribute("peopleBeans", beans);
		return "t6_23/ShowPeople";
	}

}
