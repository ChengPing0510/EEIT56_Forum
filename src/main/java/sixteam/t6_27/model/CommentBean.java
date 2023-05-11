package sixteam.t6_27.model;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedAttributeNode;
import javax.persistence.NamedEntityGraph;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "postcomments")
@Component
@NamedEntityGraph(name = "postcomments.post", attributeNodes = @NamedAttributeNode("post"))
public class CommentBean {

	public CommentBean() {
	}

	public CommentBean(String commentcontent, byte[] picture) {
	}

	@ManyToOne
//	@JsonIgnoreProperties("postcomments")
	@JsonBackReference
	@JoinColumn(name = "commentpostid")
	private PostBean post;

	public PostBean getPost() {
		return post;
	}

	public void setPost(PostBean post) {
		this.post = post;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "commentid")
	private Integer commentid;

	@Column(name = "commenttime")
	private String commenttime;

	@Column(name = "commentcontent")
	private String commentcontent;

	@Column(name = "commentpicture")
	private byte[] commentpicture;

	@Column(name = "commentlike")
	private Integer commentlike;

	@Column(name = "commentdislike")
	private Integer commentdislike;

	@Column(name = "commentpostid", insertable = false, updatable = false)
	private Integer commentpostid;

	public Integer getCommentid() {
		return commentid;
	}

	public void setCommentid(Integer commentid) {
		this.commentid = commentid;
	}

	public String getCommenttime() {
		return commenttime;
	}

	public void setCommenttime(String commenttime) {
		this.commenttime = commenttime;
	}

	public String getCommentcontent() {
		return commentcontent;
	}

	public void setCommentcontent(String commentcontent) {
		this.commentcontent = commentcontent;
	}

	public byte[] getCommentpicture() {
		return commentpicture;
	}

	public void setCommentpicture(byte[] commentpicture) {
		this.commentpicture = commentpicture;
	}

	public Integer getCommentlike() {
		return commentlike;
	}

	public void setCommentlike(Integer commentlike) {
		this.commentlike = commentlike;
	}

	public Integer getCommentdislike() {
		return commentdislike;
	}

	public void setCommentdislike(Integer commentdislike) {
		this.commentdislike = commentdislike;
	}

	public Integer getCommentpostid() {
		return commentpostid;
	}

	public void setCommentpostid(Integer commentpostid) {
		this.commentpostid = commentpostid;
	}

}
