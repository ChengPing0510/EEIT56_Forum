package sixteam.t6_23.model.matchcondition;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "matchcondition")
@Component
public class MatchCondition {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	// 存登入帳號的ID
	private Integer userid;
	
	private boolean msex;
	
	private boolean mreligion;
	
	private boolean mhobby;
	
	private boolean maddress;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public boolean isMsex() {
		return msex;
	}

	public void setMsex(boolean msex) {
		this.msex = msex;
	}

	public boolean isMreligion() {
		return mreligion;
	}

	public void setMreligion(boolean mreligion) {
		this.mreligion = mreligion;
	}

	public boolean isMhobby() {
		return mhobby;
	}

	public void setMhobby(boolean mhobby) {
		this.mhobby = mhobby;
	}

	public boolean isMaddress() {
		return maddress;
	}

	public void setMaddress(boolean maddress) {
		this.maddress = maddress;
	}

}
