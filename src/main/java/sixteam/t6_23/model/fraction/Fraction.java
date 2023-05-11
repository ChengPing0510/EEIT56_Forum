package sixteam.t6_23.model.fraction;

import java.util.HashSet;
import java.util.Set;

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

@Entity
@Table(name = "fraction")
@Component
public class Fraction {
	
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "SCORE")
	private String score;
	
//	@OneToMany(fetch = FetchType.EAGER,mappedBy = "fraction",cascade = CascadeType.ALL)
//	private Set<UserMatch> userMatchs = new HashSet<UserMatch>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

//	public Set<UserMatch> getUserMatchs() {
//		return userMatchs;
//	}
//
//	public void setUserMatchs(Set<UserMatch> userMatchs) {
//		this.userMatchs = userMatchs;
//	}
	
	

}
