package sixteam.t6_21.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class OrderItemService {
	@Autowired
	private OrderItemRepository oRepo;
	
	public OrderItemBean insert(OrderItemBean ob) {
		return oRepo.save(ob);
	}
	
	public List<OrderItemBean> findByorderNumber(int orderNumber) {
		
		return oRepo.findByorderNumber(orderNumber);
	}
	
	public void deleteAllByOrderNumber(int orderNumber) {
		oRepo.deleteAllByOrderNumber(orderNumber);
	}
	
	public void deleteByseqno(Integer seqno) {
		oRepo.deleteByseqno(seqno);
	}
	public OrderItemBean findByseqno(Integer seqno) {
		return oRepo.findByseqno(seqno);
	}

	
	
}
