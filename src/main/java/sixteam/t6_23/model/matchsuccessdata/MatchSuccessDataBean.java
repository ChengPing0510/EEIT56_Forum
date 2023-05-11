package sixteam.t6_23.model.matchsuccessdata;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "matchedsuccess")
@Component
public class MatchSuccessDataBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private Date matchdate;
	
	private Integer userid_1;
	
	private Integer userid_2;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getMatchdate() {
		return matchdate;
	}

	public void setMatchdate(Date matchdate) {
		this.matchdate = matchdate;
	}

	public Integer getUserid_1() {
		return userid_1;
	}

	public void setUserid_1(Integer userid_1) {
		this.userid_1 = userid_1;
	}

	public Integer getUserid_2() {
		return userid_2;
	}

	public void setUserid_2(Integer userid_2) {
		this.userid_2 = userid_2;
	}
	

}
