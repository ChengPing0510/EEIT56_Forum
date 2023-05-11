package sixteam.t6_10.securitymodel;

import javax.persistence.*;

@Entity
@Table(name = "REGISTDATE")
public class RegistDate {

    @Id
    @Column(name = "id")
    private int id;
    
    @Column(name = "registdate")
    private String registDate;
    
    @Column(name = "lastlogin")
    private String lastLogin;
    
    @Column(name = "days")
    private Integer days;

    
	public RegistDate() {
		super();
	}
	
	public RegistDate(int id,String registDate,String lastLogin,Integer days) {
		this.id=id;
		this.registDate=registDate;
		this.lastLogin=lastLogin;
		this.days=days;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getRegistDate() {
		return registDate;
	}


	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}


	public String getLastLogin() {
		return lastLogin;
	}


	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}


	public Integer getDays() {
		return days;
	}


	public void setDays(Integer days) {
		this.days = days;
	}



	
}
