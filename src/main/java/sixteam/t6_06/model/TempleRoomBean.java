package sixteam.t6_06.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;

import java.sql.Blob;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Entity
@Table(name="templeroomforall")
@Component
public class TempleRoomBean {
		
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name = "ROOMID")
		private int roomId;							//應該要用自動生成					
		
		@Column(name = "FK_TEMPLEID")               
		private int fk_templeId;                    //參照寺廟ID
		 
		@Column(name = "ADDRESS")
		private String address;	                    //參照寺廟地址
		
		@Column(name = "TEMPLENAME")           		
		private String templeName;					//寺廟名稱
		
		@Column(name = "ROOMTYPE")					
		private int roomtype;						//幾人房
		
		@Column(name = "ROOMPICTURE")
		private Blob roompicture;					//房型照片,也有可能改成jquery動態圖片
		
		@Column(name = "COST")
		private Integer cost;							//金額
		
		@Column(name = "FULLOREMPTY")
		private Integer fullorempty;  					//是否為空房

		public TempleRoomBean(int roomId, int fk_templeId, String address, String templeName, int roomtype,
				Blob roompicture, Integer cost, Integer fullorempty) {
			super();
			this.roomId = roomId;
			this.fk_templeId = fk_templeId;
			this.address = address;
			this.templeName = templeName;
			this.roomtype = roomtype;
			this.roompicture = roompicture;
			this.cost = cost;
			this.fullorempty = fullorempty;
		}

		public TempleRoomBean(int fk_templeId, String address, String templeName, int roomtype, Blob roompicture,
				Integer cost, Integer fullorempty) {
			super();
			this.fk_templeId = fk_templeId;
			this.address = address;
			this.templeName = templeName;
			this.roomtype = roomtype;
			this.roompicture = roompicture;
			this.cost = cost;
			this.fullorempty = fullorempty;
		}

		public TempleRoomBean() {
			super();
		}

		public int getRoomId() {
			return roomId;
		}

		public void setRoomId(int roomId) {
			this.roomId = roomId;
		}

		public int getFk_templeId() {
			return fk_templeId;
		}

		public void setFk_templeId(int fk_templeId) {
			this.fk_templeId = fk_templeId;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getTempleName() {
			return templeName;
		}

		public void setTempleName(String templeName) {
			this.templeName = templeName;
		}

		public int getRoomtype() {
			return roomtype;
		}

		public void setRoomtype(int roomtype) {
			this.roomtype = roomtype;
		}

		public Blob getRoompicture() {
			return roompicture;
		}

		public void setRoompicture(Blob roompicture) {
			this.roompicture = roompicture;
		}

		public Integer getCost() {
			return cost;
		}

		public void setCost(Integer cost) {
			this.cost = cost;
		}

		public Integer getFullorempty() {
			return fullorempty;
		}

		public void setFullorempty(Integer fullorempty) {
			this.fullorempty = fullorempty;
		}

		
		
}
