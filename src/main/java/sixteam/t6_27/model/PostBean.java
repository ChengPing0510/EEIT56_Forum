package sixteam.t6_27.model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "post")
@Component
@JsonIgnoreProperties(value = { "cBean" })
public class PostBean {

	public PostBean() {
	}

	public PostBean(String board, String title, String date, byte[] postimg, String content, Integer good, Integer bad,
			String status, Integer viewcount) {
	}

	public PostBean(Integer postid, String board, String title, String date, byte[] postimg, Integer content,
			Integer good, String bad, String status, Integer viewcount) {
	}

	@JsonIgnore
//	@JsonIgnoreProperties("post")
//	@JsonBackReference
	@OneToMany(mappedBy = "post", cascade = CascadeType.ALL)
	private List<CommentBean> cBean = new ArrayList<CommentBean>();

	public List<CommentBean> getcBean() {
		return cBean;
	}

	public void setcBean(List<CommentBean> cBean) {
		this.cBean = cBean;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "postid")
	private Integer postid;

	@Column(name = "board")
	private String board;

	@Column(name = "title")
	private String title;

	@Column(name = "date")
	private String date;

	@Column(name = "content")
	private String content;

	@Column(name = "good")
	private Integer good;

	@Column(name = "bad")
	private Integer bad;

	@Column(name = "status")
	private String status;

	@Column(name = "usersid")
	private Integer usersid;

	@Column(name = "postimg")
	private byte[] postimg;

	@Column(name = "viewcount")
	private Integer viewcount;

	public Integer getPostid() {
		return postid;
	}

	public void setPostid(Integer postid) {
		this.postid = postid;
	}

	public String getBoard() {
		return board;
	}

	public void setBoard(String board) {
		this.board = board;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getGood() {
		return good;
	}

	public void setGood(Integer good) {
		this.good = good;
	}

	public Integer getBad() {
		return bad;
	}

	public void setBad(Integer bad) {
		this.bad = bad;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getUsersid() {
		return usersid;
	}

	public void setUsersid(Integer usersid) {
		this.usersid = usersid;
	}

	public byte[] getPostimg() {
		return postimg;
	}

	public void setPostimg(byte[] postimg) {
		this.postimg = postimg;
	}

	public Integer getViewcount() {
		return viewcount;
	}

	public void setViewcount(Integer viewcount) {
		this.viewcount = viewcount;
	}

}
