package sixteam.t6_21.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderItemRepository extends JpaRepository<OrderItemBean, Integer>{
	

	public List<OrderItemBean> findByorderNumber(int orderNumber);
	void deleteAllByOrderNumber(int orderNumber);
	OrderItemBean findByseqno(Integer seqno);
	void deleteByseqno(Integer seqno);
}
