package sixteam.t6_14.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Pageable;

import sixteam.t6_14.model.Actives;



public interface ActiveService {
	public List<Actives> findAll();
	
	
	public Actives findById(Integer id) ;
	
	
	public void delete(Integer id) ;
	
	
	public Actives update(Actives active);
	
	
	public Actives save(Actives active) ;
	
	public Actives findByActivesName(String name);
	
	public List<Actives> findByTopThrNum(); 
	
	public Boolean isSignUpAllowed(Integer id);
	
}
