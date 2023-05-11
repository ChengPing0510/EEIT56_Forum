package sixteam.t6_21.model;



import java.sql.Date;
import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "class")
@Component
public class ClassBean {
	@Id
	@Column(name = "CLASSID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int classId;
	@Column(name = "CLASSNAME")
	private String className;
	@Column(name = "CLASSTEACHERNAME")
	private String classTeacherName;
	@Column(name = "CLASSPRICE")
	private Double classPrice;
	@Column(name = "CLASSPICTURE1")
	@JsonIgnore
	private byte[] classPicture1;
	@Column(name = "CLASSPICTURENAME")
	private String classPictureName;
	@Column(name = "CLASSTEACHERPICTURE")
	@JsonIgnore
	private byte[] classTeacherPicture;
	
	@Column(name = "CLASSTEACHERPICTURENAME")
	private String classTeacherPictureName;
	@Column(name = "CLASSTYPE")
	private String classType;
	@Column(name = "CLASSDATE")
	private Date classDate;
	@Column(name = "CLASSADDRESS")
	private String classAddress;
	@Column(name = "CLASSPEOPLE")
	private int classPeople;
	@Column(name = "CLASSAPPLICANT")
	private int classApplicant;
	@Column(name = "CLASSINFORMATION")
	private String classInformation;


	public ClassBean() {
	}

	public ClassBean(int classId, String className, String classTeacherName, Double classPrice, byte[] classPicture1,
			String classPictureName, byte[] classTeacherPicture, String classTeacherPictureName, String classType,
			Date classDate, String classAddress, int classPeople) {
		this.classId = classId;
		this.className = className;
		this.classTeacherName = classTeacherName;
		this.classPrice = classPrice;
		this.classPicture1 = classPicture1;
		this.classPictureName = classPictureName;
		this.classTeacherPicture = classTeacherPicture;
		this.classTeacherPictureName = classTeacherPictureName;
		this.classType = classType;
		this.classDate = classDate;
		this.classAddress = classAddress;
		this.classPeople = classPeople;
	}

	public ClassBean(String className, String classTeacherName, Double classPrice, byte[] classPicture1,
			String classPictureName, byte[] classTeacherPicture, String classTeacherPictureName, String classType,
			Date classDate, String classAddress, int classPeople) {
		super();
		this.className = className;
		this.classTeacherName = classTeacherName;
		this.classPrice = classPrice;
		this.classPicture1 = classPicture1;
		this.classPictureName = classPictureName;
		this.classTeacherPicture = classTeacherPicture;
		this.classTeacherPictureName = classTeacherPictureName;
		this.classType = classType;
		this.classDate = classDate;
		this.classAddress = classAddress;
		this.classPeople = classPeople;
	}
	
	
	public ClassBean(String className, String classTeacherName, Double classPrice, byte[] classPicture1,
			String classPictureName, byte[] classTeacherPicture, String classTeacherPictureName, String classType,
			Date classDate, String classAddress, int classPeople, int classApplicant, String classInformation) {
		super();
		this.className = className;
		this.classTeacherName = classTeacherName;
		this.classPrice = classPrice;
		this.classPicture1 = classPicture1;
		this.classPictureName = classPictureName;
		this.classTeacherPicture = classTeacherPicture;
		this.classTeacherPictureName = classTeacherPictureName;
		this.classType = classType;
		this.classDate = classDate;
		this.classAddress = classAddress;
		this.classPeople = classPeople;
		this.classApplicant = classApplicant;
		this.classInformation = classInformation;
	}

	public ClassBean(int classId, String className, String classTeacherName, Double classPrice, byte[] classPicture1,
			String classPictureName, byte[] classTeacherPicture, String classTeacherPictureName, String classType,
			Date classDate, String classAddress, int classPeople, String classInformation) {
		super();
		this.classId = classId;
		this.className = className;
		this.classTeacherName = classTeacherName;
		this.classPrice = classPrice;
		this.classPicture1 = classPicture1;
		this.classPictureName = classPictureName;
		this.classTeacherPicture = classTeacherPicture;
		this.classTeacherPictureName = classTeacherPictureName;
		this.classType = classType;
		this.classDate = classDate;
		this.classAddress = classAddress;
		this.classPeople = classPeople;
		this.classInformation = classInformation;
	}
	

	public ClassBean(int classId, String className, String classTeacherName, Double classPrice, byte[] classPicture1,
			String classPictureName, String classType, Date classDate, String classAddress, int classPeople,
			String classInformation) {
		super();
		this.classId = classId;
		this.className = className;
		this.classTeacherName = classTeacherName;
		this.classPrice = classPrice;
		this.classPicture1 = classPicture1;
		this.classPictureName = classPictureName;
		this.classType = classType;
		this.classDate = classDate;
		this.classAddress = classAddress;
		this.classPeople = classPeople;
		this.classInformation = classInformation;
	}

	public int getClassApplicant() {
		return classApplicant;
	}

	public void setClassApplicant(int classApplicant) {
		this.classApplicant = classApplicant;
	}

	public String getClassInformation() {
		return classInformation;
	}

	public void setClassInformation(String classInformation) {
		this.classInformation = classInformation;
	}

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getClassTeacherName() {
		return classTeacherName;
	}

	public void setClassTeacherName(String classTeacherName) {
		this.classTeacherName = classTeacherName;
	}

	public Double getClassPrice() {
		return classPrice;
	}

	public void setClassPrice(Double classPrice) {
		this.classPrice = classPrice;
	}

	public byte[] getClassPicture1() {
		return classPicture1;
	}

	public void setClassPicture1(byte[] classPicture1) {
		this.classPicture1 = classPicture1;
	}

	public String getClassPictureName() {
		return classPictureName;
	}

	public void setClassPictureName(String classPictureName) {
		this.classPictureName = classPictureName;
	}

	public byte[] getClassTeacherPicture() {
		return classTeacherPicture;
	}

	public void setClassTeacherPicture(byte[] classTeacherPicture) {
		this.classTeacherPicture = classTeacherPicture;
	}

	public String getClassTeacherPictureName() {
		return classTeacherPictureName;
	}

	public void setClassTeacherPictureName(String classTeacherPictureName) {
		this.classTeacherPictureName = classTeacherPictureName;
	}

	public String getClassType() {
		return classType;
	}

	public void setClassType(String classType) {
		this.classType = classType;
	}

	public Date getClassDate() {
		return classDate;
	}

	public void setClassDate(Date classDate) {
		this.classDate = classDate;
	}

	public String getClassAddress() {
		return classAddress;
	}

	public void setClassAddress(String classAddress) {
		this.classAddress = classAddress;
	}

	public int getClassPeople() {
		return classPeople;
	}

	public void setClassPeople(int classPeople) {
		this.classPeople = classPeople;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ClassBean [classId=");
		builder.append(classId);
		builder.append(", className=");
		builder.append(className);
		builder.append(", classTeacherName=");
		builder.append(classTeacherName);
		builder.append(", classPrice=");
		builder.append(classPrice);
//		builder.append(", classPicture1=");
//		builder.append(Arrays.toString(classPicture1));
		builder.append(", classPictureName=");
		builder.append(classPictureName);
//		builder.append(", classTeacherPicture=");
//		builder.append(Arrays.toString(classTeacherPicture));
		builder.append(", classTeacherPictureName=");
		builder.append(classTeacherPictureName);
		builder.append(", classType=");
		builder.append(classType);
		builder.append(", classDate=");
		builder.append(classDate);
		builder.append(", classAddress=");
		builder.append(classAddress);
		builder.append(", classPeople=");
		builder.append(classPeople);
		builder.append("]");
		return builder.toString();
	}
	
	public String getDescription() {
		return getClassTeacherName() + " " 
				+ getClassName();
	}

}