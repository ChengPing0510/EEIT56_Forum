package sixteam.t6_21.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import sixteam.t6_21.model.ClassBean;
import sixteam.t6_21.model.ClassService;
import sixteam.t6_21.model.OrderBean;

@Controller
public class ClassCrudAction {
	

	//展示課程列表(後臺維護)
	@Autowired
	private ClassService classService;
	@RequestMapping(path = "/t6_21ClassMaintain.controller")
	public String processAction(Model m) {

		List<ClassBean> classlist = classService.findAll();
		m.addAttribute("classList", classlist);
		return "t6_21/classMaintainList";
	}
	//新增課程
	@GetMapping("/t6_21insertClass.controller")
	public String processMainAction() {
		return "t6_21/ClassInsert";
	}

	@PostMapping("/insertClass.controller")
	public String processAction(@RequestParam("name") String name,@RequestParam("teacher") String teacher,@RequestParam("price") double price, @RequestParam("classFile") MultipartFile mf,
@RequestParam("teacherFile") MultipartFile mf1,@RequestParam("classtype") String classtype,@RequestParam("classaddress") String classaddress,@RequestParam("classdate") Date classdate,@RequestParam("classpeople") int classpeople,@RequestParam("classInformation") String classInformation, Model m) throws IOException {

		String fileName = mf.getOriginalFilename();
		byte[] b = mf.getBytes();
		
		String fileName1 = mf1.getOriginalFilename();
		byte[] b1 = mf1.getBytes();

		if (fileName != null && fileName.length() != 0) {
			
			saveClass(name,teacher,price,b,fileName,b1,fileName1,classtype,classdate,classaddress,classpeople,0,classInformation);
		}

		return "redirect:/t6_21ClassMaintain.controller";
	}

	private void saveClass(String className, String classTeacherName, Double classPrice, byte[] classPicture1,
			String classPictureName, byte[] classTeacherPicture, String classTeacherPictureName, String classType,
			Date classDate, String classAddress, int classPeople,int classApplicant,String classInformation) {
		ClassBean cBean = new ClassBean(className,classTeacherName,classPrice,classPicture1,classPictureName,classTeacherPicture,classTeacherPictureName,classType,classDate,classAddress,classPeople,classApplicant,classInformation);
		classService.insert(cBean);
	}
	//圖片顯示
	@RequestMapping("/t6_21images1.controller/{classId}")
	@ResponseBody
	public byte[] processByteArrayImageAction1(@PathVariable("classId") int classId, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		ClassBean cBean = classService.findById(classId);
		byte[] picturebyte = cBean.getClassPicture1();
		InputStream is = new ByteArrayInputStream(picturebyte);

		return IOUtils.toByteArray(is);

	}
	
	@RequestMapping("/t6_21imagesclassteacher.controller/{classId}")
	@ResponseBody
	public byte[] processByteArrayImageAction2(@PathVariable("classId") int classId, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		ClassBean cBean = classService.findById(classId);
		byte[] picturebyte = cBean.getClassTeacherPicture();
		InputStream is = new ByteArrayInputStream(picturebyte);

		return IOUtils.toByteArray(is);

	}
	//刪除
	@GetMapping("/t6_21deleteClass.controller/{classId}") 
	public String processDeleteAction(@PathVariable("classId") int classId) {

		classService.deleteById(classId);
		return "redirect:/t6_21ClassMaintain.controller";
	}
	
	@GetMapping("/t6_21preupdateClass.controller/{classId}")
	public String processMainAction(@PathVariable("classId") int classId, Model m) {
		ClassBean cBean = classService.findById(classId);
		m.addAttribute("bean", cBean);
		return "t6_21/classUpdateList";
	}
	
	@PostMapping("/updateClass.controller")
	public String processUpdateAction(@RequestParam("classId") int classId,@RequestParam("name") String name,@RequestParam("teacher") String teacher,@RequestParam("price") double price, @RequestParam("classFile") MultipartFile mf,
			@RequestParam("teacherFile") MultipartFile mf1,@RequestParam("classtype") String classtype,@RequestParam("classaddress") String classaddress,@RequestParam("classdate") Date classdate,@RequestParam("classpeople") int classpeople,@RequestParam("classInformation") String classInformation, Model m)
			throws IOException {
		
		String fileName = mf.getOriginalFilename();
		byte[] b = mf.getBytes();
		
		String fileName1 = mf1.getOriginalFilename();
		byte[] b1 = mf1.getBytes();
		
		//兩個圖檔都有更新
		if ((fileName != null && fileName.length() != 0) && (fileName1 != null && fileName1.length() != 0)) {
		ClassBean cbBean = new ClassBean(classId,name,teacher,price,b,fileName,b1,fileName1,classtype,classdate,classaddress,classpeople,classInformation);
		classService.update(cbBean);
		//只更新第一個
		} else if(fileName != null && fileName.length() != 0){
			ClassBean cbBean = classService.findById(classId);
			String teacherPicture = cbBean.getClassTeacherPictureName();
			byte[] d = cbBean.getClassTeacherPicture();

			ClassBean cbBean1 = new ClassBean(classId,name,teacher,price,b,fileName,d,teacherPicture,classtype,classdate,classaddress,classpeople,classInformation);
			classService.update(cbBean1);

			
		//只更新第二個
		}else if(fileName1 != null && fileName1.length() != 0) {
			ClassBean cbBean = classService.findById(classId);
			String classPicture = cbBean.getClassPictureName();
			byte[] c = cbBean.getClassPicture1();
			
			ClassBean cbBean1 = new ClassBean(classId,name,teacher,price,c,classPicture,b1,fileName1,classtype,classdate,classaddress,classpeople,classInformation);
			classService.update(cbBean1);

			
		}
		else {
		//兩個圖檔都沒更新
			ClassBean cbBean = classService.findById(classId);
			String classPicture = cbBean.getClassPictureName();
			byte[] c = cbBean.getClassPicture1();
			
			String teacherPicture = cbBean.getClassTeacherPictureName();
			byte[] d = cbBean.getClassTeacherPicture();
			
			ClassBean cbBean1 = new ClassBean(classId,name,teacher,price,c,classPicture,d,teacherPicture,classtype,classdate,classaddress,classpeople,classInformation);
			classService.update(cbBean1);
		}
		

		return "redirect:/t6_21ClassMaintain.controller";

	}
	
	//輸出檔案用
	 @GetMapping(value = "/classexportCsv.controller") 
	  public void exportCsv(HttpServletResponse response) throws IOException { 
	      String fileName = "output.csv";   //輸出CSV的檔案名稱 
	      response.setContentType("text/csv; charset=UTF-8");  //設定輸出為UTF-8中文才不會跑掉 
	      response.setHeader("Content-Disposition", "attachment; filename=" + fileName); 
	       
	      List<ClassBean> beans = classService.findAll(); 
	      //這邊要改成各自的BEAN 
	      
	      try (PrintWriter writer = response.getWriter()) { 
	       //這是各位的欄位名稱 
	          writer.println("課程編號,課程名字,課程老師名字,課程價錢,課程類型,課程日期,課程地址,課程人數上限,課程報名人數"); 
	          //這裡也要改成各位抓的值 
	          for (ClassBean bean : beans) { 
	              writer.println(bean.getClassId() + "," + bean.getClassName() + "," + bean.getClassTeacherName() 
	              + ","+ bean.getClassPrice() + "," + bean.getClassType() + "," + bean.getClassDate() + ","  
	                + bean.getClassAddress() + "," + bean.getClassPeople()+ "," + bean.getClassApplicant()); 
	          } 
	      } 
	  
	  
	      
	 }
	 
	 @GetMapping(value = "/classexportJson.controller") 
	 public void exportJson(HttpServletResponse response) throws IOException {
		 List<ClassBean> beans = classService.findAll(); 
		 Map<Integer, Object> data = new HashMap();
		 for (ClassBean bean : beans) { 
			 data.put(bean.getClassId(), bean);
			 
		 }
		    response.setContentType("application/json;charset=UTF-8");
		    response.setHeader("Content-Disposition", "attachment; filename=data.json");
		    response.getWriter().write(new ObjectMapper().writeValueAsString(data));
		  }
	@PostMapping("/addonenewclass.controller")
	public String addnewoneclass() {
		
		
		return "t6_21/ClassInsert";
		
	}

}
