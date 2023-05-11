package sixteam.t6_23.model.people;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class PeopleServiceImpl implements PeopleService {

	@Autowired
	private PeopleRepository pRepo;
	
	@Override
	public List<PeopleBean_23> findAll() {
		List<PeopleBean_23> lists = pRepo.findAll();
		return lists;
	}

	@Override
	public PeopleBean_23 findById(Integer id) {
		Optional<PeopleBean_23> op = pRepo.findById(id);
		PeopleBean_23 p1 = null;
		
		if(op.isPresent()) {
			p1 = op.get();
		}
		
		return p1;
	}

	@Override
	public void deleteById(Integer id) {
		System.out.println("----------------id="+ id);
		pRepo.deleteById(id);
	}

	@Override
	public PeopleBean_23 update(PeopleBean_23 bean) {
		return pRepo.save(bean);
	}

	@Override
	public void insert(PeopleBean_23 bean) {
		pRepo.save(bean);
	}

	@Override
	public List<PeopleBean_23> findByNameLike(String name) {
		String lname = "%"+name+"%";
		
		return pRepo.findByNameLike(lname);
	}

	@Override
	public Page<PeopleBean_23> findAllByPage(Pageable pageable){
		return pRepo.findAll(pageable);
	}
	
	
	
}
