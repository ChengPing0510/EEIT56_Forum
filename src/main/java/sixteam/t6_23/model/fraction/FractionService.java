package sixteam.t6_23.model.fraction;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FractionService {

	@Autowired
	private FractionRepository fRep;
	
	public Fraction findByScore(String score){
		Optional<Fraction> op = fRep.findByScore(score);
		Fraction fraction = null;
		if(op.isPresent()) {
			fraction = op.get();
			return fraction;
		}
		return fraction;
	}
}
