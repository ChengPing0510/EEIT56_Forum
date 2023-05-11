package sixteam.t6_21.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface OrderRepository extends JpaRepository<OrderBean, Integer>{
	
	public List<OrderBean> findByMemberId(int memberId);
	
	public OrderBean findByorderNumber(int orderNumber);
	public void deleteByorderNumber(Integer orderNumber);
	@Modifying
	@Query("UPDATE OrderBean o SET o.paymentStatus = '已付款' WHERE o.orderNumber = :orderNumber")
	public int updatePaymentStatus(@Param("orderNumber")int orderNumber);
	
	@Modifying
	@Query("UPDATE OrderBean o SET o.orderPrice = :orderPrice WHERE o.orderNumber = :orderNumber")
	public int updateOrderPrice(@Param("orderPrice")Double orderPrice,@Param("orderNumber")int orderNumber);
	
	@Modifying
	@Query("UPDATE OrderBean o SET o.orderPrice = o.orderPrice-:seqnoprice WHERE o.orderNumber = :orderNumber")
	public int updateOrderPriceDetail(@Param("seqnoprice")Double seqnoprice,@Param("orderNumber")int orderNumber);
	
	@Modifying
	@Query("SELECT o FROM OrderBean o ORDER BY o.orderDate ASC")
	public List<OrderBean> findByorderDateOrderByAsc();
	
	@Modifying
	@Query("SELECT o FROM OrderBean o ORDER BY o.orderPrice DESC")
	public List<OrderBean> findByorderPriceByDESC();
	
	@Modifying
	@Query("SELECT o FROM OrderBean o ORDER BY o.orderNumber ASC")
	public List<OrderBean> findByorderNumberOrderByAsc();


}
