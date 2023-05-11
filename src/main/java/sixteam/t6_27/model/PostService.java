package sixteam.t6_27.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class PostService {

	@Autowired
	private PostRepository pRepo;

	// 新增
	public PostBean add(PostBean pBean) {
		return pRepo.save(pBean);
	}

	// 全部查詢
	public List<PostBean> findAll() {
		return pRepo.findAll();
	}

	// Id查詢
	public PostBean findById(Integer postid) {
		return pRepo.findById(postid).get();
	}

	// 刪除
	public void delete(Integer postid) {
		pRepo.deleteById(postid);
	}

	// 修改
	public PostBean update(PostBean pBean) {
		return pRepo.save(pBean);
	}

	// 找看板
	public List<PostBean> getPostsByBoard(String board) {
		return pRepo.findByBoard(board);
	}

	// 熱門文章TOP5
	public List<PostBean> findTop5ByOrderByGoodDesc() {
		return pRepo.findTop5ByOrderByGoodDesc();
	}

	// 喜歡
	public int likePost(Integer postid) {
		return pRepo.increasepostlike(postid);
	}

	// 不喜歡
	public int dislikePost(Integer postid) {
		return pRepo.increasepostdislike(postid);
	}

	// By 使用者id 查詢 文章id
	public Page<PostBean> findByUsersid(Integer usersid, Pageable pageable) {
		return pRepo.findByUsersid(usersid, pageable);
	}

	// 前台模糊查詢
	public List<PostBean> FindPostByTitle(String title) {
		return pRepo.FindPostByTitle(title);
	}

	// 文章觀看次數
	public int showViewCount(Integer viewcount) {
		return pRepo.increaseviewcount(viewcount);
	}

	// 用戶刪除文章
	public void userDeletePost(Integer postid) {
		PostBean post = pRepo.findById(postid).orElse(null);
		if (post != null) {
			post.setStatus("用戶刪除");
			pRepo.save(post);
		}
	}

	// 用戶檢舉文章
	public void reportPost(Integer postid) {
		PostBean post = pRepo.findById(postid).orElse(null);
		if (post != null) {
			post.setStatus("檢舉");
			pRepo.save(post);
		}
	}

	// 後台封鎖文章
	public void blockPost(Integer postid) {
		PostBean post = pRepo.findById(postid).orElse(null);
		if (post != null) {
			post.setStatus("封鎖");
			pRepo.save(post);
		}
	}

	public Page<PostBean> findByUsersidAndStatusNot(Integer postid, String status, Pageable pageable) {
		return pRepo.findByUsersidAndStatusNot(postid, status, pageable);
	}

	public List<PostBean> findByBoardAndStatusNot(String board, String status) {
		return pRepo.findByBoardAndStatusNot(board, status);
	}

}
