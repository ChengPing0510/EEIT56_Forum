package sixteam.t6_06.model;

import java.util.LinkedList;
import java.util.List;

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
@Table(name="Temple")
@Component
public class TempleBean {
		
	
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name = "TEMPLEID")
		private int templeId;   			// 編號
		
		@Column(name = "TEMPLENAME")
		private String templeName;   			// 寺廟名稱
		
		@Column(name = "DEITIESNAME")
		private String deitiesName;   			// 主祀神
		
		@Column(name = "ADMINISTRATIVE")
		private String administrative;       			// 行政區
		
		@Column(name = "ADDRESS")
		private String address;				// 地址
		
		@Column(name = "SECT")
		private String sect;     			// 教別
		
		@Column(name = "PHONE")
		private String phone;				// 電話
		
		@Column(name = "WGS84X")
		private Double WGS84X;				// X座標
		
		@Column(name = "WGS84Y")
		private Double WGS84Y;				// Y座標

		public TempleBean(int templeId, String templeName, String deitiesName, String administrative, String address,
				String sect, String phone, Double wGS84X, Double wGS84Y) {
			super();
			this.templeId = templeId;
			this.templeName = templeName;
			this.deitiesName = deitiesName;
			this.administrative = administrative;
			this.address = address;
			this.sect = sect;
			this.phone = phone;
			WGS84X = wGS84X;
			WGS84Y = wGS84Y;
		}

		public TempleBean(String templeName, String deitiesName, String administrative, String address, String sect,
				String phone, Double wGS84X, Double wGS84Y) {
			super();
			this.templeName = templeName;
			this.deitiesName = deitiesName;
			this.administrative = administrative;
			this.address = address;
			this.sect = sect;
			this.phone = phone;
			WGS84X = wGS84X;
			WGS84Y = wGS84Y;
		}

		public TempleBean() {
			super();
		}

		public int getTempleId() {
			return templeId;
		}

		public void setTempleId(int templeId) {
			this.templeId = templeId;
		}

		public String getTempleName() {
			return templeName;
		}

		public void setTempleName(String templeName) {
			this.templeName = templeName;
		}

		public String getDeitiesName() {
			return deitiesName;
		}

		public void setDeitiesName(String deitiesName) {
			this.deitiesName = deitiesName;
		}

		public String getAdministrative() {
			return administrative;
		}

		public void setAdministrative(String administrative) {
			this.administrative = administrative;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getSect() {
			return sect;
		}

		public void setSect(String sect) {
			this.sect = sect;
		}

		public String getPhone() {
			return phone;
		}

		public void setPhone(String phone) {
			this.phone = phone;
		}

		public Double getWGS84X() {
			return WGS84X;
		}

		public void setWGS84X(Double wGS84X) {
			WGS84X = wGS84X;
		}

		public Double getWGS84Y() {
			return WGS84Y;
		}

		public void setWGS84Y(Double wGS84Y) {
			WGS84Y = wGS84Y;
		}
		

}
