package sixteam.t6_27.model;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface PostRepository extends JpaRepository<PostBean, Integer> {

	// By看板查詢
	List<PostBean> findByBoard(String board);

	// 熱門文章TOP5
	List<PostBean> findTop5ByOrderByGoodDesc();

	// 看板模糊查詢
	@Query(value = "SELECT p FROM PostBean p WHERE p.title LIKE %:title%")
	List<PostBean> FindPostByTitle(String title);

	// 喜歡
	@Modifying
	@Query(value = "UPDATE PostBean p SET p.good = p.good + 1 WHERE p.postid = :postid")
	public int increasepostlike(@Param("postid") Integer postid);

	// 不喜歡
	@Modifying
	@Query(value = "UPDATE PostBean p SET p.bad = p.bad + 1 WHERE p.postid = :postid")
	public int increasepostdislike(@Param("postid") Integer postid);

	// By 使用者id 查詢 文章id
	@Query("SELECT p FROM PostBean p WHERE p.usersid = :usersid")
	public Page<PostBean> findByUsersid(@Param("usersid") Integer usersid, Pageable pageable);

	// 文章觀看次數
	@Modifying
	@Query(value = "UPDATE PostBean p SET p.viewcount = p.viewcount + 1 WHERE p.postid = :postid")
	public int increaseviewcount(@Param("postid") Integer postid);

	// 用使用者id找文章id及文章狀態
	public Page<PostBean> findByUsersidAndStatusNot(@Param("usersid") Integer usersid, @Param("status") String status,
			Pageable pageable);

	// 找看板及文章狀態
	public List<PostBean> findByBoardAndStatusNot(String board, String status);

}
