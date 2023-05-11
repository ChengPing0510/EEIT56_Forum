package sixteam.t6_14.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import sixteam.t6_10.securitymodel.User;


public interface MyFavoriteActiveRepository extends JpaRepository<MyFavoriteActives,Integer >{
	
	public Optional<MyFavoriteActives> findByuserAndActive(User user,Actives actives);
	
	public Optional<MyFavoriteActives> findByactive_activeID(Integer activeId);
	
	@Query("SELECT a FROM MyFavoriteActives mfa JOIN mfa.active a WHERE mfa.user.id = :userid ORDER BY mfa.addTime ASC")
	List<Actives> findActivesByUseridOrderByAddTimeAsc(@Param("userid") Integer userid);
	
	public List<MyFavoriteActives> findByactive(Actives actives);

	public List<MyFavoriteActives> findByuser(User user);
	
	@Query("SELECT COUNT(f) FROM MyFavoriteActives f JOIN f.active WHERE f.active.activeID = :activeid")
	public Integer countByActiveID(@Param("activeid") Integer activeID);

}
