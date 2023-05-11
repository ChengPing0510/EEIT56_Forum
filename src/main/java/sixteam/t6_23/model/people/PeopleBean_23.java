package sixteam.t6_23.model.people;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Entity
@Table(name = "people_23")
@Component
public class PeopleBean_23 {
	
	@Id
	@Column(name = "USERID")
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer userid;
	
	@Column(name = "NAME")
	private String name;
	
	@Column(name = "USERAGE")
	private Integer age;
	
	@Column(name = "SEX")
	private String sex;
	
	@Column(name = "ADDRESS")
	private String address;
	
	@Column(name = "STAR_SIGN")
	private String star;//星座v
	
	@Column(name = "EMOTION")
	private String emotion;//感情狀況v
	
	@Column(name = "PROFESSION")
	private String profession;//職業v
	
	@Column(name = "PERSONALITY")
	private String personality;//個性v
	
	@Column(name = "HOBBY")
	private String hobby;//興趣v
	
	@Column(name = "DREAM")
	private String dream;//夢想v
	
	@Column(name = "INTRODUCTION")
	private String introduction;//自介
	
	@Column(name = "PERSON_IMG")
	private byte[] images;//照片v
	
	@Column(name = "RELIGION")
	private String religion;//宗教v
	
	@Column(name = "SEX_ORIENTATION")
	private String sex_in;//性取向v
	
	@Column(name = "INCOME")
	private Double income;//收入v

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStar() {
		return star;
	}

	public void setStar(String star) {
		this.star = star;
	}

	public String getEmotion() {
		return emotion;
	}

	public void setEmotion(String emotion) {
		this.emotion = emotion;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getPersonality() {
		return personality;
	}

	public void setPersonality(String personality) {
		this.personality = personality;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getDream() {
		return dream;
	}

	public void setDream(String dream) {
		this.dream = dream;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public byte[] getImages() {
		return images;
	}

	public void setImages(byte[] images) {
		this.images = images;
	}

	public String getReligion() {
		return religion;
	}

	public void setReligion(String religion) {
		this.religion = religion;
	}

	public String getSex_in() {
		return sex_in;
	}

	public void setSex_in(String sex_in) {
		this.sex_in = sex_in;
	}

	public Double getIncome() {
		return income;
	}

	public void setIncome(Double income) {
		this.income = income;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
