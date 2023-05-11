package sixteam.t6_14.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.NamedAttributeNode;
import javax.persistence.NamedEntityGraph;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import sixteam.t6_10.securitymodel.User;

@Table(name = "eventregistrations")
@Entity
@Component
@NamedEntityGraph(name = "eventregistrations.actives", attributeNodes = @NamedAttributeNode("actives"))
public class EventRegistrations {
	@Id@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "participantid")
	private Integer participantId;
	@Column(name = "participantname")
	private String participantName;
	@Column(name = "participantemail")
	private String participantEmail;
	@Column(name = "participantphone")
	private String participantPhone;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "activeid")
	private Actives actives;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "userid")
	private User users;
	public Integer getParticipantId() {
		return participantId;
	}
	public void setParticipantId(Integer participantId) {
		this.participantId = participantId;
	}
	public String getParticipantName() {
		return participantName;
	}
	public void setParticipantName(String participantName) {
		this.participantName = participantName;
	}
	public String getParticipantEmail() {
		return participantEmail;
	}
	public void setParticipantEmail(String participantEmail) {
		this.participantEmail = participantEmail;
	}
	public String getParticipantPhone() {
		return participantPhone;
	}
	public void setParticipantPhone(String participantPhone) {
		this.participantPhone = participantPhone;
	}
	public Actives getActives() {
		return actives;
	}
	public void setActives(Actives actives) {
		this.actives = actives;
	}
	public User getUsers() {
		return users;
	}
	public void setUsers(User users) {
		this.users = users;
	}
	
	public EventRegistrations( String participantName, String participantEmail,
			String participantPhone, Actives actives, User users) {
		
		this.participantName = participantName;
		this.participantEmail = participantEmail;
		this.participantPhone = participantPhone;
		this.actives = actives;
		this.users = users; 
	}
	public EventRegistrations() {
	}

}
