package sixteam.t6_14.model;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import sixteam.t6_10.securitymodel.User;

@Service
@Transactional
public class MyFavoriteActiveService {
	@Autowired
	private MyFavoriteActiveRepository favActiveRepository;
	
	public MyFavoriteActives save(MyFavoriteActives favActive) {
		return favActiveRepository.save(favActive); 
	}
	
	
	public MyFavoriteActives findByUserAndActive(User user,Actives active) {
		
		Optional<MyFavoriteActives> result= favActiveRepository.findByuserAndActive(user, active);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	
	public MyFavoriteActives findById(Integer id) {
		Optional<MyFavoriteActives> result =favActiveRepository.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	
	public void deleteFav(User user,Actives active) {
		// 檢查活動是否存在
				Optional<MyFavoriteActives> favActive=favActiveRepository.findByuserAndActive(user, active);
				if(favActive.isPresent()) {
					MyFavoriteActives myfav=favActive.get();
					myfav.setActive(null);
					myfav.setUser(null);
					favActiveRepository.delete(favActive.get());
				}else {
							throw new RuntimeException("活動不存在，無法刪除");
				}
				
	}
	
	public List<Actives> findAllFavActives(Integer userId) {
		List<Actives> favActives=favActiveRepository.findActivesByUseridOrderByAddTimeAsc(userId);
		if(favActives!=null) {
			return favActives;
		}
		return null;
	}
	
	public Integer countFavoriteByActiveID(Integer activeID) {
        return favActiveRepository.countByActiveID(activeID);
    }
	
	
	

}
