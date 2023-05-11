package sixteam.t6_14.model;



import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


public interface ActivesRepository extends JpaRepository<Actives, Integer>{
	
	
	
	
	
	
	
	
	public Optional<Actives> findByactiveName(String name);
	@Query("FROM Actives a\r\n"
			+ "ORDER BY a.activeSignUpNumber DESC \r\n"
			+ "")
	public List<Actives> findTop3Orderby(Pageable pageable); 



}
