package sixteam.t6_06.model;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class TempleRoomService {
	
	
	@Autowired
	private TempleRoomDao trDao;
	
	//找單個
	public TempleRoomBean findById(int roomId) {
		Optional<TempleRoomBean> op = trDao.findById(roomId);
		TempleRoomBean bean = null;
		if (op.isPresent()) {
			bean = op.get();
		}
		return bean;
	}
	
	//用寺廟id找房間
	public List<TempleRoomBean> findByFk_templeId(int fk_templeId){
		return trDao.findByFk_templeId(fk_templeId);
	}
	
	//找全部
	public List<TempleRoomBean> findAlltest(){
		return trDao.findAlltest();
	}
	
	//新增
	public TempleRoomBean insert(TempleRoomBean trb) {
		return trDao.save(trb);
	}
	
	//更新
	public TempleRoomBean update(TempleRoomBean trb) {
		return trDao.save(trb);
			
	}
	
	//刪除
	public void deleteById(int id) {
		trDao.deleteById(id);
		
	}
	
}
