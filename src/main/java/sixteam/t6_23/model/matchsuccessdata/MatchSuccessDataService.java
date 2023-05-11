package sixteam.t6_23.model.matchsuccessdata;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MatchSuccessDataService {
	
	@Autowired
	private MatchSuccessDataRepository msRep;
	
	public void insert(MatchSuccessDataBean bean) {
		msRep.save(bean);
	}
	
	public List<MatchSuccessDataBean> findAll(){
		List<MatchSuccessDataBean> lists = msRep.findAll();
		
		return lists;
	}

}
