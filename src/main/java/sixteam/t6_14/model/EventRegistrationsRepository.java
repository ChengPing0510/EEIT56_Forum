package sixteam.t6_14.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import sixteam.t6_10.securitymodel.User;

public interface EventRegistrationsRepository extends JpaRepository<EventRegistrations, Integer>{
	
	
	public List<EventRegistrations> findByActives(Actives actives);
	
	@Query("SELECT a FROM EventRegistrations er JOIN er.actives a WHERE er.users.id = :userid")
	public List<Actives> findActivesByUserid(@Param("userid") Integer userid);
	
    public List<EventRegistrations> findAllByUsers_id(Integer userId);
    
    public List<EventRegistrations> findByusers(User user);

    public List<EventRegistrations> findAllByactives_activeID(Integer activeId);

}
