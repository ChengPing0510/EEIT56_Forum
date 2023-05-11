package sixteam.t6_06.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TempleRoomOrderDao extends JpaRepository<TempleRoomOrderBean, Integer>{
	
	@Query(value="SELECT * FROM TempleRoomOrderList where roomId=?1",nativeQuery=true)
	public List<TempleRoomOrderBean> finddate(int roomId);
	
	@Query(value="select * from TempleRoomOrderList where orderId=(select max(orderId) from TempleRoomOrderList) AND userId=?1",nativeQuery=true)
	public TempleRoomOrderBean findOrderList(int userId);
	
	@Query(value="select * from TempleRoomOrderList order by orderId desc",nativeQuery=true)
	public List<TempleRoomOrderBean> findallfromback();
	
	@Query(value="select * from TempleRoomOrderList where userId=?",nativeQuery=true)
	public List<TempleRoomOrderBean> findOrderListAll(int userId);

	@Query(value="select * from TempleRoomOrderList where orderId=?",nativeQuery=true)
	public TempleRoomOrderBean findByorderId(int orderId);
	
	@Query(value="select * from TempleRoomOrderList where userId=? and deletebymember='未刪除'",nativeQuery=true)
	public List<TempleRoomOrderBean> findOrderListAllExcept(int userId);

	@Query(value="SELECT TOP 3 * FROM TempleRoomOrderList",nativeQuery=true)
	public List<TempleRoomOrderBean> findthree();
}
