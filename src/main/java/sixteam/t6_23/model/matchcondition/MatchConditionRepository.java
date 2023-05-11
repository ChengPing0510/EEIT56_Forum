package sixteam.t6_23.model.matchcondition;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MatchConditionRepository extends JpaRepository<MatchCondition, Integer> {
	
	Optional<MatchCondition> findByUserid(Integer userid);

}
