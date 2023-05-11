package sixteam.t6_06.controller;


import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import sixteam.t6_06.model.TempleBean;
import sixteam.t6_06.model.TempleRoomBean;
import sixteam.t6_06.model.TempleRoomService;
import sixteam.utils.Utils;

@Controller
public class TempleRoomController {
		
	@Autowired
	private TempleRoomService trService;
	
	public int tentacles;
	
	//只找全部房間
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@RequestMapping(path = "/templeRoomSellectAllAction")
	public String templeRoomSellectAllAction(Model m,Model m1,@ModelAttribute("message") TempleBean tmpb) {
		ArrayList<TempleBean> list = new ArrayList<TempleBean>();
		list.add(tmpb);
		List<TempleRoomBean> beans = trService.findAlltest();
		m1.addAttribute("tmp",list);
		m.addAttribute("trmp", beans);
		
		
		return "t6_06/TempleRoom";
	}
	
	//新增有日期
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@PostMapping("/insertTempleRoomDataAction")
	public String insertTempleRoomDataAction(@RequestParam("intempleId") int fk_templeId,@RequestParam("intempleName") String templeName,@RequestParam("inaddress") String address, @RequestParam("inroomtype") int roomtype,
								@RequestParam("inroompicture") MultipartFile mf,@RequestParam("incost") Integer cost,
								@RequestParam("infullorempty") Integer fullorempty, @RequestParam("tentacles") int tentacles, Model m) throws IOException, ParseException, SerialException, SQLException {
		
		//圖片轉格式
		InputStream is = mf.getInputStream();
		long size = mf.getSize();
		byte[] b = new byte[(int) size];
		is.read(b);
		SerialBlob roompicture = new SerialBlob(b);
		
        for (int i = 0; i < tentacles; i++) {
        	TempleRoomBean trb = new TempleRoomBean(fk_templeId, address, templeName, roomtype, roompicture, cost, fullorempty);
        	trService.insert(trb);
			
		}
			
		return "redirect:templeRoomSellectAllAction";
	}
	
	//更新有日期
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@PostMapping("/updateTempleRoomDataAction")
	public String updateTempleRoomDataAction(@RequestParam("inroomId") int roomId,@RequestParam("intempleId") int fk_templeId,@RequestParam("intempleName") String templeName,@RequestParam("inaddress") String address, @RequestParam("inroomtype") int roomtype,
								@RequestParam("inroompicture") MultipartFile mf,@RequestParam("incost") Integer cost,
								@RequestParam("infullorempty") Integer fullorempty, Model m) throws IOException, ParseException, SerialException, SQLException {
		
		//圖片轉格式
		InputStream is = mf.getInputStream();
		long size = mf.getSize();
		byte[] b = new byte[(int) size];
		is.read(b);
		SerialBlob roompicture = new SerialBlob(b);
		
        
		TempleRoomBean trb = new TempleRoomBean(roomId,fk_templeId, address, templeName, roomtype, roompicture, cost, fullorempty);
		trService.update(trb);
			
		return "redirect:templeRoomSellectAllAction";
	}
	
	//刪除
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@PostMapping("/templeRoomDeleteAction/{roomId}")
	@ResponseBody
	public String templeDeleteAction(@PathVariable("roomId")int roomId) {
		trService.deleteById(roomId);
		return "OK";
	}
	
	//顯示圖片
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@GetMapping("/t6_6_img.controller/{roomId}")
	@ResponseBody
	public byte[] processByteArrayImageAction(@PathVariable("roomId") int roomId, HttpServletRequest request,
			HttpServletResponse response) throws IOException, SQLException {
		TempleRoomBean trb = trService.findById(roomId);
		Blob pBlob = trb.getRoompicture();
		
		InputStream binaryStream = pBlob.getBinaryStream();
		return IOUtils.toByteArray(binaryStream);
	}
	
	
}
