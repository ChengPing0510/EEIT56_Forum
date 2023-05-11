package sixteam.t6_23.model.people;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;


public interface PeopleService {

public List< PeopleBean_23> findAll();
	
	public  PeopleBean_23 findById(Integer id);
	
	public void deleteById(Integer id); 
    
    public PeopleBean_23 update( PeopleBean_23 bean); 
    
    void insert(PeopleBean_23 bean);
    
    public List<PeopleBean_23> findByNameLike(String name);
//    public List<PeopleBean_23> findAllPeople(String name);

	public Page<PeopleBean_23> findAllByPage(Pageable pageable);

	
}
