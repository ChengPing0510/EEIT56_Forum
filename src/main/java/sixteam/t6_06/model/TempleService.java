package sixteam.t6_06.model;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
@Transactional
public class TempleService {
	
	@Autowired
	private TempleDao tDao;
	
	//搜尋單個
	public TempleBean findById(int templeId) {
		Optional<TempleBean> op = tDao.findById(templeId);
		TempleBean bean = null;
		if (op.isPresent()) {
			bean = op.get();
		}
		return bean;
	}
	
	//找全部
	public List<TempleBean> findAlltest(){
		return tDao.findAlltest();
	}
	
	//新增
	public TempleBean insert(TempleBean tmpb) {
		return tDao.save(tmpb);
	}
	
	//更新
	public TempleBean update(TempleBean tmpb) {
		return tDao.save(tmpb);
		
	}
	
	//刪除
	public void deleteById(int id) {
		tDao.deleteById(id);
		
	}
	
}
