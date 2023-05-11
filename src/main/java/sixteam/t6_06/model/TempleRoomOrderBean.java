package sixteam.t6_06.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="templeroomorderlist")
@Component
public class TempleRoomOrderBean {	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ORDERID")	
	private int orderId;						//訂單流水號
	
	@Column(name = "USERID")
	private int userId;							//用戶id
	
	@Column(name = "ROOMID")	
	private int roomId;							//房間id
	
	@Column(name = "TEMPLENAME")	
	private String templeName;					//寺廟名稱
		
	@Column(name = "CHECKINDATE")
	private Date checkindate;					//入住日期
	
	@Column(name = "CHECKOUTDATE")
	private Date checkoutdate;					//退房日期
	
	@Column(name = "NUMBEROFNIGHTS")
	private Integer numberofnights;  			//過夜天數
	
	@Column(name = "COST")
	private Integer cost;						//金額
	
	@Column(name = "DELETEBYMEMBER")            //會員刪除可是後臺還看得到的判斷
	private String deletebymember;

	
	
	public TempleRoomOrderBean() {
		super();
	}


	public TempleRoomOrderBean(int orderId, int userId, int roomId, String templeName, Date checkindate,
			Date checkoutdate, Integer numberofnights, Integer cost, String deletebymember) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.roomId = roomId;
		this.templeName = templeName;
		this.checkindate = checkindate;
		this.checkoutdate = checkoutdate;
		this.numberofnights = numberofnights;
		this.cost = cost;
		this.deletebymember = deletebymember;
	}
	
	
	public TempleRoomOrderBean(int userId, int roomId, String templeName, Date checkindate, Date checkoutdate,
			Integer numberofnights, Integer cost, String deletebymember) {
		super();
		this.userId = userId;
		this.roomId = roomId;
		this.templeName = templeName;
		this.checkindate = checkindate;
		this.checkoutdate = checkoutdate;
		this.numberofnights = numberofnights;
		this.cost = cost;
		this.deletebymember = deletebymember;
	}



	public TempleRoomOrderBean(Date checkindate, Date checkoutdate) {
		super();
		this.checkindate = checkindate;
		this.checkoutdate = checkoutdate;
	}


	@Override
	public String toString() {
		return "TempleRoomOrderBean [orderId=" + orderId + ", userId=" + userId + ", roomId=" + roomId + ", templeName="
				+ templeName + ", checkindate=" + checkindate + ", checkoutdate=" + checkoutdate + ", numberofnights="
				+ numberofnights + ", cost=" + cost + ", deletebymember=" + deletebymember + "]";
	}


	public int getOrderId() {
		return orderId;
	}


	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public int getRoomId() {
		return roomId;
	}


	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}


	public String getTempleName() {
		return templeName;
	}


	public void setTempleName(String templeName) {
		this.templeName = templeName;
	}


	public Date getCheckindate() {
		return checkindate;
	}


	public void setCheckindate(Date checkindate) {
		this.checkindate = checkindate;
	}


	public Date getCheckoutdate() {
		return checkoutdate;
	}


	public void setCheckoutdate(Date checkoutdate) {
		this.checkoutdate = checkoutdate;
	}


	public Integer getNumberofnights() {
		return numberofnights;
	}


	public void setNumberofnights(Integer numberofnights) {
		this.numberofnights = numberofnights;
	}


	public Integer getCost() {
		return cost;
	}


	public void setCost(Integer cost) {
		this.cost = cost;
	}


	public String getDeletebymember() {
		return deletebymember;
	}


	public void setDeletebymember(String deletebymember) {
		this.deletebymember = deletebymember;
	}

}
