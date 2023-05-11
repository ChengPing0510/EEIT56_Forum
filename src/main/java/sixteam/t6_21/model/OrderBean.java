package sixteam.t6_21.model;

import java.util.Date;
import java.util.LinkedHashSet;
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
@Entity
@Table(name ="orders")
//訂單資料整理
public class OrderBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ORDERNUMBER")
	int orderNumber;
	@Column(name="MEMBERID")
	int memberId;
	@Column(name="MEMBERACCOUNT")
	String memberAccount;
	@Column(name="MEMBEREMAIL")
	String memberEmail;
	@Column(name="MEMBERPHONE")
	String memberPhone;
	@Column(name="ORDERDATE")
	Date orderDate;
	@Column(name="ORDERPRICE")
	Double orderPrice;
	@Column(name="PAYMENTSTATUS")
	String paymentStatus;

	public void setItems(Set<OrderItemBean> items) {
//		this.items = items;
	}

	public OrderBean() {
	}
	
	


	public OrderBean(int orderNumber, int memberId, String memberAccount, String memberEmail, String memberPhone,
			Date orderDate, Double orderPrice, String paymentStatus) {
		super();
		this.orderNumber = orderNumber;
		this.memberId = memberId;
		this.memberAccount = memberAccount;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.orderDate = orderDate;
		this.orderPrice = orderPrice;
		this.paymentStatus = paymentStatus;
	}

	public OrderBean(int memberId,String memberAccount, String memberEmail, String memberPhone, Date orderDate, Double orderPrice) {
		this.memberId = memberId;
		this.memberAccount = memberAccount;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.orderDate = orderDate;
		this.orderPrice = orderPrice;
	}



	public OrderBean(int orderNumber, int memberId, String memberAccount, String memberEmail, String memberPhone,
			Date orderDate, Double orderPrice) {
		super();
		this.orderNumber = orderNumber;
		this.memberId = memberId;
		this.memberAccount = memberAccount;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.orderDate = orderDate;
		this.orderPrice = orderPrice;
	}

	public String getMemberAccount() {
		return memberAccount;
	}

	public void setMemberAccount(String memberAccount) {
		this.memberAccount = memberAccount;
	}

	public int getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Double getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(Double orderPrice) {
		this.orderPrice = orderPrice;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("OrderBean [orderNumber=");
		builder.append(orderNumber);
		builder.append(", memberId=");
		builder.append(memberId);
		builder.append(", memberAccount=");
		builder.append(memberAccount);
		builder.append(", memberEmail=");
		builder.append(memberEmail);
		builder.append(", memberPhone=");
		builder.append(memberPhone);
		builder.append(", orderDate=");
		builder.append(orderDate);
		builder.append(", orderPrice=");
		builder.append(orderPrice);
		builder.append("]");
		return builder.toString();
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	
	
	
}
