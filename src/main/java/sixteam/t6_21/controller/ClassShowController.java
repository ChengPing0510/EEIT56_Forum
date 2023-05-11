package sixteam.t6_21.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sixteam.t6_21.model.ClassBean;
import sixteam.t6_21.model.ClassService;

@Controller
public class ClassShowController {
	
	
	
	@Autowired
	private ClassService classService;
	
	@GetMapping("/showClassDetail.controller/{classId}")
	public String processAction(@PathVariable("classId") int classId, Model m) {

		ClassBean cb = classService.findById(classId);
		m.addAttribute("bean", cb);
		
		List<ClassBean> classtypelist = classService.findByclassType(cb.getClassType());
		
		for(int i=0;i<classtypelist.size();i++) {
			if(cb.getClassId()  == classtypelist.get(i).getClassId()) {
				classtypelist.remove(i);
			}
		}
//		if(classtypelist.size()>2) {
//			classtypelist.subList(0, 3);	
//		}		
		m.addAttribute("classtypelist", classtypelist.subList(0, 3));
		return "t6_21/ClassDetail";
	}
	
	@GetMapping("/showAllClass.controller")
	public String processAction(Model m) {

		List<ClassBean> classlist = classService.findAll();
		m.addAttribute("classList", classlist);
		return "t6_21/ClassList";
	}
	
	@GetMapping("/showTypeClass.controller/{classtype}")
	public String processAction2(@PathVariable("classtype") String classType,Model m) {

		List<ClassBean> classlist = classService.findByclassType(classType);
		System.out.println(classlist.toString());
		m.addAttribute("classList", classlist);
		return "t6_21/ClassList";
	}
	
	//秀出課程排序
	@GetMapping("/showClassOrderBy.controller/{classorderby}")
	public String processAction3(@PathVariable("classorderby") int classorderby,Model m) {
		
		if(classorderby == 1) {
			List<ClassBean> classlist = classService.findByClassApplicantByAsc();
			m.addAttribute("classList", classlist);
			return "t6_21/ClassList";

		}else if(classorderby == 2) {
			List<ClassBean> classlist = classService.findByClassDateOrderByAsc();
			m.addAttribute("classList", classlist);
			return "t6_21/ClassList";

		}
		return null;

	}

}
