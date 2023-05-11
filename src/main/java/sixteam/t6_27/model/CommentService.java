package sixteam.t6_27.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ch.qos.logback.core.status.Status;

@Service
@Transactional
public class CommentService {

	@Autowired
	private CommentRepository cRepo;

	// 新增
//	public CommentBean add(CommentBean cBean) {
//		return cRepo.save(cBean);
//	}

	// 新增
	public CommentBean add(CommentBean cBean, PostBean pBean) {
		List<CommentBean> commentlist = new ArrayList<CommentBean>();
		commentlist.add(cBean);

		pBean.setcBean(commentlist);
		cBean.setPost(pBean);

		return cRepo.save(cBean);
	}

	// 刪除
	public void delete(Integer commentid) {
		cRepo.deleteById(commentid);
	}

	// 修改
	public CommentBean update(CommentBean cBean) {
		return cRepo.save(cBean);
	}

	// 全部查詢
	public List<CommentBean> findAll() {
		return cRepo.findAll();
	}

	// Id查詢comment
	public CommentBean findById(Integer commentid) {
		return cRepo.findById(commentid).get();
	}

	// By postId 查詢 comment
	public List<CommentBean> findByCommentpostid(Integer commentpostid) {
		return cRepo.findByCommentpostid(commentpostid);
	}

	public int likeComment(Integer commentid) {
        return cRepo.increasecommentlike(commentid);
    }

	public int dislikeComment(Integer commentid) {
		return cRepo.increasecommentdislike(commentid);
	}

}
