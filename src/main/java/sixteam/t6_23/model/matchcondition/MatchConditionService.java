package sixteam.t6_23.model.matchcondition;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MatchConditionService {
	
	@Autowired
	private MatchConditionRepository mcRep;
	
	
	// 存登入帳號的ID
	public void save(MatchCondition bean) {
		mcRep.save(bean);
	}
	
	public MatchCondition findByUserId(Integer userid) {
		Optional<MatchCondition> op = mcRep.findByUserid(userid);
		MatchCondition mc = null;
		if(op.isPresent()) {
			mc = op.get();
		}
		return mc;
	}

}
