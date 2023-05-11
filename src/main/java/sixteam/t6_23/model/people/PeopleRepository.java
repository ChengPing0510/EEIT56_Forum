package sixteam.t6_23.model.people;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface PeopleRepository extends JpaRepository<PeopleBean_23, Integer> {
	
	public List<PeopleBean_23> findByNameLike(String name);
	
	
	
}


