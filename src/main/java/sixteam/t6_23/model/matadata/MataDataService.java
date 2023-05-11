package sixteam.t6_23.model.matadata;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MataDataService {
	
	@Autowired
	private MataDataRepository mdRep;
	
	public List<MataDataBean> findAll(){
		return mdRep.findAll();
	}
	
	public MataDataBean save(MataDataBean bean) {
		return mdRep.save(bean);
	}

}
