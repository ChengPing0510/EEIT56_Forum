package sixteam.t6_23.model.usermatch;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface MatchRepository extends JpaRepository<UserMatch, Integer> {

	public List<UserMatch> findByNameLike(String name);
	
	@Query(value = "from UserMatch where userid = ?1")
	public UserMatch findByUserId(Integer id);
	
	Optional<UserMatch> findByUserid(Integer userid);
	
	@Query(value = "from UserMatch where fractionid = ?1 and not (userid = ?2) and match = true order by newid()")
	public HashSet<UserMatch> findByFractionAndUserid(Integer fractionid, Integer userid);
	

	@Query(value = "from UserMatch where not (userid = ?1) and match = true order by newid()")
	public HashSet<UserMatch> findByUseridAndMatch(Integer userid);

}
