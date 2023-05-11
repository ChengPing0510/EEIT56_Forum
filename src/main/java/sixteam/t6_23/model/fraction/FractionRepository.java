package sixteam.t6_23.model.fraction;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface FractionRepository extends JpaRepository<Fraction, Integer> {
	
	Optional<Fraction> findByScore(String score);

}
