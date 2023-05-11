package sixteam.t6_23.model.usermatch;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class UserMatchService {

	@Autowired
	private MatchRepository mRep;
	
	public List<UserMatch> findAll(){
		return mRep.findAll();
	}
	
	public UserMatch findById(Integer id) {
		Optional<UserMatch> op = mRep.findById(id);
		UserMatch p1 = null;
		if(op.isPresent()) {
			p1 = op.get();
		}
		
		return p1;
	}
	
	public void deleteById(Integer id) {
		mRep.deleteById(id);
	}
	
	public UserMatch insert(UserMatch bean) {
		return mRep.save(bean);
	}
	
	public UserMatch update(UserMatch bean) {
		return mRep.save(bean);
	}
	
	public List<UserMatch> findByNameLike(String name){
		String lname = "%"+name+"%";
		return mRep.findByNameLike(lname);
	}
	
	
	public UserMatch findByUserid(Integer userid) {
		Optional<UserMatch> op = mRep.findByUserid(userid);
		UserMatch uMatch = null;
		if(op.isPresent()) {
			uMatch = op.get();
			return uMatch;
		}
		return uMatch;
	}
	
	public Set<UserMatch> findByFractionAndUserid(Integer fractionid, Integer userid){
		System.out.println("------------------------------>gggggggggggggg");
		return mRep.findByFractionAndUserid(fractionid, userid);
	}
	
	public Set<UserMatch> findByUseridAndMatch(Integer userid){
		System.out.println("------------------------------>gggggggggggggg");
		return mRep.findByUseridAndMatch(userid);
	}
	
}
