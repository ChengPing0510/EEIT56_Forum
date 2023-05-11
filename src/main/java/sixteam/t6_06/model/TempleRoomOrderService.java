package sixteam.t6_06.model;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class TempleRoomOrderService {
	
	@Autowired
	private TempleRoomOrderDao troDao;
	
	
	public List<TempleRoomOrderBean> findAlltest(){
		return troDao.findallfromback();
	}
	
	//新增
	public TempleRoomOrderBean insert(TempleRoomOrderBean trob) {
		return troDao.save(trob);
	}
		
	//更新
	public TempleRoomOrderBean update(TempleRoomOrderBean trob) {
		return troDao.save(trob);
				
	}
		
	//刪除
	public void deleteById(int id) {
		troDao.deleteById(id);
			
	}
	
	//找訂單日期計算出出chart.js
	public List<TempleRoomOrderBean> templeRoomOrderDate(int roomId) {
		return troDao.finddate(roomId);
			
	}
	
	//找出該用戶最新的訂單資料
	public TempleRoomOrderBean findOrderList(int userId){
		return troDao.findOrderList(userId);
	}
	
	//找出該用戶所有的訂單資料
	public List<TempleRoomOrderBean> findOrderListAll(int userId){
		return troDao.findOrderListAll(userId);
	
	}
	
	//找出該用戶所有的訂單資料
	public List<TempleRoomOrderBean> findOrderListAllExcept(int userId){
		return troDao.findOrderListAllExcept(userId);
		
	}
	
	//靠id找訂單
	public TempleRoomOrderBean findByorderId(int orderId) {
		return troDao.findByorderId(orderId);
	}
	
	//找三筆顯示在主頁
	public List<TempleRoomOrderBean> findthree() {
		return troDao.findthree();
	}
}
