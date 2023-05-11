package sixteam.t6_06.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import sixteam.t6_06.model.TempleRoomOrderBean;
import sixteam.t6_06.model.TempleRoomOrderService;

@Controller
public class TempleRoomOrderController {

	@Autowired
	private TempleRoomOrderService troService;

	public int insertnum;

	// 找全部
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@RequestMapping(path = "/TempleRoomOrdersSellectAllAction")
	public String TempleRoomOrdersSellectAllAction(Model m2) {
		List<TempleRoomOrderBean> beans = troService.findAlltest();
		m2.addAttribute("trob", beans);
		return "t6_06/TempleRoomOrderList";
	}

	// 新增
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@PostMapping("/insertTempleRoomOrderDataAction")
	public String insertTempleRoomDataAction(@RequestParam("insuserId") int userId,
			@RequestParam("insroomId") int roomId, @RequestParam("instempleName") String templeName,
			@RequestParam("inscheckindate") String checkindate1, @RequestParam("inscheckoutdate") String checkoutdate1,
			@RequestParam("inscost") Integer cost, @RequestParam("insertnum") Integer insertnum,@RequestParam("indeletebymember") String deletebymember, Model m)
			throws IOException, ParseException, SerialException, SQLException {
		// 日期轉型 先把字串轉成util Date再轉乘sql Date 原因:sql Date可以只顯示日期不含分秒
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date ucheckindate = format.parse(checkindate1);
		java.util.Date ucheckoutdate = format.parse(checkoutdate1);
		java.sql.Date checkindate = new java.sql.Date(ucheckindate.getTime());
		java.sql.Date checkoutdate = new java.sql.Date(ucheckoutdate.getTime());

		// 自動計算入住日期有幾天-之後要加入判斷

		long diff = checkoutdate.getTime() - checkindate.getTime();
		Integer numberofnights = (int) diff / (24 * 60 * 60 * 1000);
		System.out.println(templeName);
		for (int i = 0; i < insertnum; i++) {
			TempleRoomOrderBean trob = new TempleRoomOrderBean(userId, roomId, templeName, checkindate, checkoutdate,
					numberofnights, cost,deletebymember);
			troService.insert(trob);

		}

		return "redirect:TempleRoomOrdersSellectAllAction";
	}

	// 更新有日期
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@PostMapping("/updateTempleRoomOrderDataAction")
	public String updateTempleRoomOrderDataAction(@RequestParam("insorderId") int uporderId,
			@RequestParam("insuserId") int userId, @RequestParam("insroomId") int roomId,
			@RequestParam("instempleName") String templeName, @RequestParam("inscheckindate") String checkindate1,
			@RequestParam("inscheckoutdate") String checkoutdate1, @RequestParam("inscost") Integer cost,@RequestParam("indeletebymember") String deletebymember, Model m)
			throws IOException, ParseException, SerialException, SQLException {

		// 日期轉型 先把字串轉成util Date再轉乘sql Date 原因:sql Date可以只顯示日期不含分秒
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date ucheckindate = format.parse(checkindate1);
		java.util.Date ucheckoutdate = format.parse(checkoutdate1);
		java.sql.Date checkindate = new java.sql.Date(ucheckindate.getTime());
		java.sql.Date checkoutdate = new java.sql.Date(ucheckoutdate.getTime());

		// 自動計算入住日期有幾天-之後要加入判斷
		long diff = checkoutdate.getTime() - checkindate.getTime();
		Integer numberofnights = (int) diff / (24 * 60 * 60 * 1000);

		TempleRoomOrderBean trob = new TempleRoomOrderBean(uporderId, userId, roomId, templeName, checkindate,
				checkoutdate, numberofnights, cost,deletebymember);
		troService.update(trob);

		return "redirect:TempleRoomOrdersSellectAllAction";
	}

	// 刪除
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@GetMapping("/templeRoomOrderDeleteAction/{orderId}")
	@ResponseBody
	public String templeDeleteAction(@PathVariable("orderId") int orderId) {
		troService.deleteById(orderId);
		return "OK";
	}

//  先靠房間編號從所有訂單抓出入住日期和退房日期,然後抓單筆訂單中的入住日期和退房日期if這兩個的月份相同就相加減,else就先該月份
//  入住日期加入該月份的入住天數總額,退房日期減掉該月份加入該月份入住天數總額,回傳1到12月的入住天數總額陣列
//	CharTypeDescriptor.js日期判斷
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@GetMapping("/templeRoomOrderDate/{roomId}")
	@ResponseBody
	public int[] templeRoomOrderDate(@PathVariable("roomId") int roomId) {
		int[] x = new int[12];
		List<TempleRoomOrderBean> beans = troService.templeRoomOrderDate(roomId);
		System.out.println(beans);
		Calendar cal = Calendar.getInstance();
		// 抓出每一張訂單的入住日期和退房日期
		for (int i = 0; i < beans.size(); i++) {
			TempleRoomOrderBean bean = beans.get(i);
			Date checkindate = bean.getCheckindate();
			Date checkoutdate = bean.getCheckoutdate();
			// 抓出入住日期的月份
			cal.setTime(checkindate);
			int monthcheckindate = cal.get(Calendar.MONTH) + 1;
			// 抓出退房的月份
			cal.setTime(checkoutdate);
			int monthcheckoutdate = cal.get(Calendar.MONTH) + 1;

			// 抓出入住日期月份的最後一天
			cal.setTime(checkindate);
			cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
			java.sql.Date lastDayOfMonth = new java.sql.Date(cal.getTime().getTime());

			// 抓出退房日期月份的第一天
			cal.setTime(checkoutdate);
			cal.set(Calendar.DAY_OF_MONTH, 1);
			java.sql.Date firstDayOfMonth = new java.sql.Date(cal.getTime().getTime());

			if (monthcheckindate == monthcheckoutdate) {
				// 取得入住天數
				long diff = checkoutdate.getTime() - checkindate.getTime();
				Integer numberofnights = (int) diff / (24 * 60 * 60 * 1000);
				// 如果陣列[j]和月份相同則把入住天數寫入陣列[j]
				for (int j = 0; j < x.length; j++) {
					if (j == (monthcheckindate - 1)) {

						x[j] += numberofnights;
					}
				}
			} else {

				// 將入住日期減掉該月的最後一天
				long diff = lastDayOfMonth.getTime() - checkindate.getTime();
				Integer diffcheckindate = ((int) diff / (24 * 60 * 60 * 1000)) + 1;
				// 將退房日期減掉該月的第一天
				long diff2 = checkoutdate.getTime() - firstDayOfMonth.getTime();
				Integer diffcheckoutdate = ((int) diff2 / (24 * 60 * 60 * 1000)) + 1;

				for (int j = 0; j < x.length; j++) {
					if (j == (monthcheckindate - 1)) {

						x[j] += diffcheckindate;
					}
					if (j == (monthcheckoutdate - 1)) {

						x[j] += diffcheckoutdate;
					}
				}
			}

		}
		return x;
	}
}