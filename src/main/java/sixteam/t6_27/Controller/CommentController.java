package sixteam.t6_27.Controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import sixteam.t6_27.model.CommentBean;
import sixteam.t6_27.model.CommentService;
import sixteam.t6_27.model.PostBean;
import sixteam.t6_27.model.PostService;

@Controller
public class CommentController {

	@Autowired
	private PostService pService;

	@Autowired
	private CommentService cService;

	// 新增
	@PostMapping("/t6_27addComment.controller")
	public String processInsertCommentAction(@RequestParam("commentcontent") String commentcontent,

			@RequestParam(value = "commentpostid", required = true) Integer commentpostid, Model m) throws IOException {
		System.out.println("準備送出留言~~~~");
//		String filename = mf.getOriginalFilename();
//		byte[] picture = mf.getBytes();
//		if (filename != null && filename.length() != 0) {

		CommentBean cBean = new CommentBean();

		// 拿現在時間
		LocalDateTime now = LocalDateTime.now();

		// 轉時間格式
		String dateString = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		cBean.setCommenttime(dateString);

		cBean.setCommentpostid(commentpostid);
		cBean.setCommentcontent(commentcontent);
		cBean.setCommentlike(0);
		cBean.setCommentdislike(0);

		PostBean pBean = pService.findById(commentpostid);
		CommentBean comments = cService.add(cBean, pBean);
		System.out.println("留言發出去囉~~~");
//		return comments;
//		}
		return "redirect:/t6_27findCommentByPostId.controller/" + commentpostid;
	}

	// 刪除
	@RequestMapping("/t6_27deleteComment.controller/{commentid}")
	@ResponseBody
	public void processDeleteCommentAction(@PathVariable("commentid") Integer commentid) {
		cService.delete(commentid);
		System.out.println("刪除成功~~~~~~~~~~~~~~~~" + commentid);
	}

	// 用postId 查詢對應的 comment
	@GetMapping("/t6_27findCommentByPostId.controller/{id}")
	public String processFindByPostIdAction(@PathVariable("id") Integer id, Model m1) {

		PostBean pBean = pService.findById(id);
		List<CommentBean> commentlist = cService.findByCommentpostid(id);

		m1.addAttribute("post", pBean);
		m1.addAttribute("comments", commentlist);

		return "t6_27/t6_27ShowPostDetailPage";
	}

	// 顯示圖片
	@RequestMapping("/t6_27commentImg.controller/{commentid}")
	@ResponseBody
	public byte[] processByteArrayImageAction(@PathVariable("commentid") Integer commentid, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		CommentBean cBean = cService.findById(commentid);
		byte[] pic = cBean.getCommentpicture();
		InputStream is = new ByteArrayInputStream(pic);
		return IOUtils.toByteArray(is);
	}

//	============================前台start================================================

	// 查詢前台文章留言內容
	@GetMapping("/t6_27findFontPostDetail.controller/{id}")
	public String processFindByPostDetail(@PathVariable("id") Integer id, Model m1) {

		PostBean pBean = pService.findById(id);
		List<CommentBean> commentlist = cService.findByCommentpostid(id);
		List<PostBean> hotpostlist = pService.findTop5ByOrderByGoodDesc();

		m1.addAttribute("post", pBean);
		m1.addAttribute("commentlist", commentlist);
		m1.addAttribute("hotpostlist", hotpostlist);

		return "t6_27/t6_27ShowFrontPostDetailPage";
	}

	// 新增前台留言
	@PostMapping("/t6_27addFrontComment.controller")
	public String processInsertFrontCommentAction(@RequestParam("commentid") Integer commentid, @RequestParam("commentcontent") String commentcontent,

			@RequestParam(value = "commentpostid", required = true) Integer commentpostid, Model m) throws IOException {
		System.out.println("準備送出前台留言~~~~");
//			String filename = mf.getOriginalFilename();
//		byte[] picture = mf.getBytes();
//			if (filename != null && filename.length() != 0) {

		CommentBean cBean = new CommentBean();

		// 拿現在時間
		LocalDateTime now = LocalDateTime.now();

		// 轉時間格式
		String dateString = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		cBean.setCommenttime(dateString);

		cBean.setCommentid(commentid);
		cBean.setCommentpostid(commentpostid);
		cBean.setCommentcontent(commentcontent);
		cBean.setCommentlike(0);
		cBean.setCommentdislike(0);

		PostBean pBean = pService.findById(commentpostid);
		CommentBean comments = cService.add(cBean, pBean);
		System.out.println("前台留言發出去囉~~~");
//			return comments;
//			}
		return "redirect:/t6_27findFontPostDetail.controller/" + commentpostid;
	}

	// 喜歡留言
	@SuppressWarnings("rawtypes") // 避免系統跳出警示
	@PostMapping("/likeComment.controller")
	public ResponseEntity likeComment(@RequestParam("commentid") Integer commentid) {
		cService.likeComment(commentid);
		return ResponseEntity.ok().build();
	}

	// 不喜歡留言
	@SuppressWarnings("rawtypes") // 避免系統跳出警示
	@PostMapping("/dislikeComment.controller")
	public ResponseEntity dislikeComment(@RequestParam("commentid") Integer commentid) {
		cService.dislikeComment(commentid);
		return ResponseEntity.ok().build();
	}

//	============================前台end==================================================

}
