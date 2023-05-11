package sixteam.t6_27.Controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
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
import org.springframework.web.multipart.MultipartFile;

import sixteam.t6_27.model.PostBean;
import sixteam.t6_27.model.PostService;
import sixteam.utils.Utils;

@Controller
public class PostController {

	@Autowired
	private PostService pService;

	@Autowired
	private Utils uService;

//	=================================後台start==========================================

	// GO新增頁面
	@GetMapping("/t6_27addPage.controller")
	public String toAddView(Principal principal) {
		System.out.println("有人要來發文囉");
		return "t6_27/t6_27AddPage";
	}

	// 新增
	@PostMapping("/t6_27add.controller")
	public String InsertPostController(@RequestParam("board") String board, @RequestParam("title") String title,
			@RequestParam("postimg") MultipartFile postimg, @RequestParam("content") String content,
			Principal principal) throws IOException {

		PostBean post = new PostBean();

		// 拿現在時間
		LocalDateTime now = LocalDateTime.now();

		// 轉時間格式
		String dateString = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		post.setDate(dateString);

		post.setBoard(board);
		post.setTitle(title);
		post.setPostimg(postimg.getBytes());
		post.setContent(content);
		post.setGood(0);
		post.setBad(0);
		post.setStatus("公開");
		post.setViewcount(0);
		post.setUsersid(uService.getUserId(principal)); // 獲取用戶ID

		System.out.println("新增文章~~~~~~~" + postimg);

		pService.add(post);

		return "redirect:/t6_27show.controller";
	}

	// 刪除
	@GetMapping("/t6_27delete.controller/{postid}")
	public String processDeleteAction(@PathVariable Integer postid) {
		pService.delete(postid);
		return "redirect:/t6_27show.controller";
	}

	// GO修改頁面
	@GetMapping("/t6_27updatePage.controller/{postid}")
	public String UpdatePage(@PathVariable("postid") Integer postid, Model m) {
		PostBean result = pService.findById(postid);
		m.addAttribute("bean", result);
		return "t6_27/t6_27UpdatePage";
	}

	// 修改
	@PostMapping("/t6_27update.controller")
	public String UpdatePostController(@RequestParam("postid") Integer postid, @RequestParam("board") String board,
			@RequestParam("title") String title, @RequestParam("status") String status,
			@RequestParam("content") String content, @RequestParam("postimg") MultipartFile postimg,
			Principal principal, @RequestParam("good") Integer good, @RequestParam("bad") Integer bad,
			@RequestParam("viewcount") Integer viewcount) throws IOException {

		PostBean post = new PostBean();

		// 拿現在時間
		LocalDateTime now = LocalDateTime.now();

		// 轉時間格式
		String dateString = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		post.setDate(dateString);

		post.setPostid(postid);
		post.setBoard(board);
		post.setTitle(title);
		post.setPostimg(postimg.getBytes());
		post.setContent(content);
		post.setGood(good);
		post.setBad(bad);
		post.setViewcount(viewcount);
		post.setStatus(status);
		post.setUsersid(uService.getUserId(principal)); // 獲取用戶ID

		pService.update(post);

		return "redirect:/t6_27show.controller/";

	}

	// 查全部
	@GetMapping("/t6_27show.controller")
	public String findAll(Model m) {
		List<PostBean> postlist = pService.findAll();
		m.addAttribute("postlist", postlist);
		return "t6_27/t6_27FindAll";
	}

	// 查Id
	@GetMapping("/t6_27findById.controller/{postid}")
	public String processFindByIdAction(@PathVariable("postid") Integer postid, Model m) throws IOException {

		PostBean pBean = pService.findById(postid);

		m.addAttribute("post", pBean);

		return "t6_27/t6_27ShowPostDetailPage";
	}

	// 查圖片
	@RequestMapping("/t6_27img.controller/{postid}")
	@ResponseBody
	public byte[] processByteArrayImageAction(@PathVariable("postid") Integer postid, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PostBean pBean = pService.findById(postid);
		byte[] picbyte = pBean.getPostimg();
		InputStream is = new ByteArrayInputStream(picbyte);
		return IOUtils.toByteArray(is);
	}

	// 封鎖文章
	@SuppressWarnings("rawtypes") // 避免系統跳出警示
	@PostMapping("/blockPost")
	public ResponseEntity blockPost(@RequestParam("postid") Integer postid) {
		pService.blockPost(postid);
		return ResponseEntity.ok().build();
	}

//	=================================後台End============================================

//	=================================前台start==========================================

	// 到個人文章操作頁面
	@Secured({ "ROLE_USER", "ROLE_ADMIN" })
	@RequestMapping("/t6_27showFrontUserPostListPage.controller/{pageNo}")
	public String frontUserPostList(@PathVariable("pageNo") Integer pageNo, Model model, Principal p) {

		int id = uService.getUserId(p);
		int pageSize = 10;
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);

		Page<PostBean> page = pService.findByUsersidAndStatusNot(id, "封鎖", pageable);

		model.addAttribute("nowPage", pageable);
		model.addAttribute("totalPages", page.getTotalPages());
		model.addAttribute("userPost", page.getContent());

		System.out.println("去個人文章專區~~~");
		System.out.println(id);

		return "t6_27/t6_27FrontUserPostList";
	}

	// 看板查詢
	@GetMapping("/t6_27showboard.controller")
	public String getPostsByBoard(@RequestParam("board") String board, @RequestParam("title") @Nullable String title,
	        Model model) {
	    if (title != null) {
	        List<PostBean> posts = pService.FindPostByTitle(title);
	        List<PostBean> hotpostlist = pService.findTop5ByOrderByGoodDesc();

	        model.addAttribute("board", posts);
	        model.addAttribute("hotpostlist", hotpostlist);

	        return "t6_27/t6_27FrontPostBoardListPage";
	    }
	    List<PostBean> posts = pService.findByBoardAndStatusNot(board, "封鎖");
	    List<PostBean> hotpostlist = pService.findTop5ByOrderByGoodDesc();

	    model.addAttribute("board", posts);
	    model.addAttribute("hotpostlist", hotpostlist);
	    return "t6_27/t6_27FrontPostBoardListPage";
	}

	// GO前台論壇
	@GetMapping("/t6_27showFrontforumPage.controller")
	public String frontforum() {
		System.out.println("去神明看板囉~~");
		return "t6_27/t6_27front_forum";
	}

	@GetMapping("/t6_27showFontAddPage.controller")
	public String FrontAddPage(Principal principal) {
		return "t6_27/t6_27FrontAddPage";
	}

	// 前台新增文章
	@PostMapping("/t6_27addFrontPost.controller")
	public String InsertFrontPostController(@RequestParam("board") String board, @RequestParam("title") String title,
			@RequestParam("postimg") MultipartFile postimg, @RequestParam("content") String content,
			Principal principal) throws IOException {

		PostBean post = new PostBean();

		// 拿現在時間
		LocalDateTime now = LocalDateTime.now();

		// 轉時間格式
		String dateString = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		post.setDate(dateString);

		post.setBoard(board);
		post.setTitle(title);
		post.setPostimg(postimg.getBytes());
		post.setContent(content);
		post.setGood(0);
		post.setBad(0);
		post.setViewcount(0);
		post.setStatus("公開");
		post.setUsersid(uService.getUserId(principal)); // 獲取用戶ID

		System.out.println("TEST: " + post);

		pService.add(post);

		return "redirect:/t6_27showFrontforumPage.controller";
	}

	// GO前台修改頁面
	@GetMapping("/t6_27showFontUpdatePage.controller/{postid}")
	public String FrontUpdatePage(@PathVariable("postid") Integer postid, Model m) {
		PostBean result = pService.findById(postid);
		m.addAttribute("bean", result);
		return "t6_27/t6_27FrontUpdatePage";
	}

	// 前台修改文章
	@PostMapping("/t6_27updatefront.controller")
	public String UpdateFrontPostController(@RequestParam("postid") Integer postid, @RequestParam("board") String board,
			@RequestParam("title") String title, @RequestParam("status") String status,
			@RequestParam("postimg") MultipartFile postimg, @RequestParam("content") String content, Model m,
			@RequestParam("good") Integer good, @RequestParam("bad") Integer bad,
			@RequestParam("viewcount") Integer viewcount, Principal principal) throws IOException {
//
		System.out.println("修改前台文章~~~~~~~~~~~~~~");

		PostBean post = new PostBean();

		// 拿現在時間
		LocalDateTime now = LocalDateTime.now();

		// 轉時間格式
		String dateString = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		post.setDate(dateString);

		post.setPostid(postid);
		post.setBoard(board);
		post.setTitle(title);
		post.setPostimg(postimg.getBytes());
		post.setContent(content);
		post.setGood(good);
		post.setBad(bad);
		post.setViewcount(viewcount);
		post.setStatus(status);
		post.setUsersid(uService.getUserId(principal)); // 獲取用戶ID

		pService.update(post);
		System.out.println("修改前台文章OK~~~~~~~~~~~~~~");

		return "redirect:/t6_27showFrontUserPostListPage.controller/1";
	}

	// 喜歡
	@SuppressWarnings("rawtypes") // 避免系統跳出警示
	@PostMapping("/likePost.controller")
	public ResponseEntity likeAction(@RequestParam("postid") Integer postid) {
		pService.likePost(postid);
		return ResponseEntity.ok().build();
	}

	// 不喜歡
	@SuppressWarnings("rawtypes") // 避免系統跳出警示
	@PostMapping("/dislikePost.controller")
	public ResponseEntity dislikeAction(@RequestParam("postid") Integer postid) {
		pService.dislikePost(postid);
		return ResponseEntity.ok().build();
	}

	// 文章觀看次數
	@SuppressWarnings("rawtypes") // 避免系統跳出警示
	@PostMapping("/viewCount.controller")
	public ResponseEntity showViewCount(@RequestParam("postid") Integer postid) {
		pService.showViewCount(postid);
		return ResponseEntity.ok().build();
	}

	// 用戶刪除文章
	@SuppressWarnings("rawtypes") // 避免系統跳出警示
	@PostMapping("/userDeletePost")
	public ResponseEntity userDeletePost(@RequestParam("postid") Integer postid) {
		pService.userDeletePost(postid);
		return ResponseEntity.ok().build();
	}

	// 檢舉文章
	@SuppressWarnings("rawtypes") // 避免系統跳出警示
	@PostMapping("/reportPost")
	public ResponseEntity reportPost(@RequestParam("postid") Integer postid) {
		pService.reportPost(postid);
		return ResponseEntity.ok().build();
	}


//	=================================前台End============================================	


}
