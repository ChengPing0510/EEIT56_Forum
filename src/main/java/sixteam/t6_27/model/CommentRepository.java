package sixteam.t6_27.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CommentRepository extends JpaRepository<CommentBean, Integer> {

	// 查詢
//	@Query(value = "FROM postcomments WHERE postid = ?1")
	public List<CommentBean> findByCommentpostid(Integer commentpostid);

	// 喜歡
	@Modifying
	@Query(value = "UPDATE CommentBean c SET c.commentlike = c.commentlike + 1 WHERE c.commentid = :commentid")
	public int increasecommentlike(@Param("commentid") Integer commentid);

	// 不喜歡
	@Modifying
	@Query(value = "UPDATE CommentBean c SET c.commentdislike = c.commentdislike + 1 WHERE c.commentid = :commentid")
	public int increasecommentdislike(@Param("commentid") Integer commentid);

}
