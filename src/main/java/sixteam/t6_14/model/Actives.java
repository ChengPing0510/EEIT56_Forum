package sixteam.t6_14.model;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.Arrays;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Component
@Entity
@Table(name = "templeactive")
public class Actives {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "activeid")
	private Integer activeID;
	@Column(name = "activename")
	private String activeName;
	@Column(name = "activeimg")
	@JsonIgnore
	private byte[] activeImg;
	@Column(name = "activedescription")
	private String activeDescription;
	@Column(name = "activestartdate")
	private Date activeStartDate;
	@Column(name = "activeenddate")
	private Date activeEndDate;
	@Column(name = "activelocation")
	private String activeLocation;
	@Column(name = "activehost")
	private String activeHost;
	@Column(name = "activeparticipantnum")
	private Integer activeParticipantNum;
	@OneToMany(mappedBy = "actives")
	private List<EventRegistrations> eventRegistrations;
	@Column(name = "activeprice")
	private BigDecimal activePrice;	
	@Column(name = "activesignupnumber")
	private Integer activeSignUpNumber;
	




	
	
	
	
	




	public Integer getActiveSignUpNumber() {
		return activeSignUpNumber;
	}






	public void setActiveSignUpNumber(Integer activeSignUpNumber) {
		this.activeSignUpNumber = activeSignUpNumber;
	}






	public Actives(String activeName, byte[] activeImg, String activeDescription, Date activeStartDate,
			Date activeEndDate, String activeLocation, String activeHost, Integer activeParticipantNum,
			BigDecimal activePrice, int activeSignUpNumber) {
		super();
		this.activeName = activeName;
		this.activeImg = activeImg;
		this.activeDescription = activeDescription;
		this.activeStartDate = activeStartDate;
		this.activeEndDate = activeEndDate;
		this.activeLocation = activeLocation;
		this.activeHost = activeHost;
		this.activeParticipantNum = activeParticipantNum;
		this.activePrice = activePrice;
		this.activeSignUpNumber = activeSignUpNumber;
	}






	public Actives(Integer activeID, String activeName, byte[] activeImg, String activeDescription,
			Date activeStartDate, Date activeEndDate, String activeLocation, String activeHost,
			Integer activeParticipantNum, BigDecimal activePrice, int activeSignUpNumber) {
		super();
		this.activeID = activeID;
		this.activeName = activeName;
		this.activeImg = activeImg;
		this.activeDescription = activeDescription;
		this.activeStartDate = activeStartDate;
		this.activeEndDate = activeEndDate;
		this.activeLocation = activeLocation;
		this.activeHost = activeHost;
		this.activeParticipantNum = activeParticipantNum;
		this.activePrice = activePrice;
		this.activeSignUpNumber = activeSignUpNumber;
	}






	public BigDecimal getActivePrice() {
		return activePrice;
	}






	public void setActivePrice(BigDecimal activePrice) {
		this.activePrice = activePrice;
	}






	public Integer getActiveParticipantNum() {
		return activeParticipantNum;
	}






	public void setActiveParticipantNum(Integer activeParticipantNum) {
		this.activeParticipantNum = activeParticipantNum;
	}








	
	







	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Actives [activeID=").append(activeID).append(", activeName=").append(activeName)
				.append(", activeImg=").append(Arrays.toString(activeImg)).append(", activeDescription=")
				.append(activeDescription).append(", activeStartDate=").append(activeStartDate)
				.append(", activeEndDate=").append(activeEndDate).append(", activeLocation=").append(activeLocation)
				.append(", activeHost=").append(activeHost).append(", activeParticipantNum=")
				.append(activeParticipantNum).append(", eventRegistrations=").append(eventRegistrations).append("]");
		return builder.toString();
	}





	public Integer getActiveID() {
		return activeID;
	}





	public void setActiveID(Integer activeID) {
		this.activeID = activeID;
	}





	public String getActiveName() {
		return activeName;
	}





	public void setActiveName(String activeName) {
		this.activeName = activeName;
	}





	public byte[] getActiveImg() {
		return activeImg;
	}





	public void setActiveImg(byte[] activeImg) {
		this.activeImg = activeImg;
	}





	public String getActiveDescription() {
		return activeDescription;
	}





	public void setActiveDescription(String activeDescription) {
		this.activeDescription = activeDescription;
	}





	public Date getActiveStartDate() {
		return activeStartDate;
	}





	public void setActiveStartDate(Date activeStartDate) {
		this.activeStartDate = activeStartDate;
	}





	public Date getActiveEndDate() {
		return activeEndDate;
	}





	public void setActiveEndDate(Date activeEndDate) {
		this.activeEndDate = activeEndDate;
	}





	public String getActiveLocation() {
		return activeLocation;
	}





	public void setActiveLocation(String activeLocation) {
		this.activeLocation = activeLocation;
	}





	public String getActiveHost() {
		return activeHost;
	}





	public void setActiveHost(String activeHost) {
		this.activeHost = activeHost;
	}

























	public Actives() {
	}

}
