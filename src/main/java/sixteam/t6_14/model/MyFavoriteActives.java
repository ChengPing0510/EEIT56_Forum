package sixteam.t6_14.model;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import sixteam.t6_10.securitymodel.User;

@Entity
@Table(name = "myfavoriteactives")
public class MyFavoriteActives {

	public MyFavoriteActives() {
	}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "myfavoriteactiveid")
	private Integer myFavoriteActiveid;
	@JoinColumn(name = "userid")
	@ManyToOne(cascade = CascadeType.ALL)
	private User user;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "activeid")
	private Actives active;
	@Column(name = "addtime")
	private Timestamp addTime;
	
	
	
	
	public MyFavoriteActives(User user, Actives active, Timestamp addTime) {
		super();
		this.user = user;
		this.active = active;
		this.addTime = addTime;
	}
	public MyFavoriteActives(Integer myFavoriteActiveid, User user, Actives active, Timestamp addTime) {
		super();
		this.myFavoriteActiveid = myFavoriteActiveid;
		this.user = user;
		this.active = active;
		this.addTime = addTime;
	}
	public Timestamp getAddTime() {
		return addTime;
	}
	public void setAddTime(Timestamp addTime) {
		this.addTime = addTime;
	}
	public Integer getMyFavoriteActiveid() {
		return myFavoriteActiveid;
	}
	public void setMyFavoriteActiveid(Integer myFavoriteActiveid) {
		this.myFavoriteActiveid = myFavoriteActiveid;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Actives getActive() {
		return active;
	}
	public void setActive(Actives active) {
		this.active = active;
	}
	
	

}
