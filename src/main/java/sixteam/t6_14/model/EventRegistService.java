package sixteam.t6_14.model;

import java.util.List;
import java.util.Optional;

import javax.management.RuntimeErrorException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sixteam.t6_14.model.EventRegistrations;


@Transactional
@Service
public class EventRegistService {

	@Autowired
	private EventRegistrationsRepository eventRegistRepository;

	
	public List<EventRegistrations> findAll() {
	return	 eventRegistRepository.findAll();
	
	}

	
	public EventRegistrations findById(Integer id) {
		Optional<EventRegistrations> optional = eventRegistRepository.findById(id);
		return optional.get();
	}

	
	public void delete(Integer id) {

		 eventRegistRepository.deleteById(id);
	}

	
	public EventRegistrations update(EventRegistrations active) {

		return eventRegistRepository.save(active);
		

	}

	
	public EventRegistrations save(EventRegistrations active) {

		return eventRegistRepository.save(active);
		

	}

	public List<Actives> findEnrolled(Integer userid) {
		List<Actives> result=eventRegistRepository.findActivesByUserid(userid);
		if(result!=null) {
			return result;
		}
		throw new RuntimeException("找不到已報名活動清單");
	}
	
	public List<Actives> findAllByUserId(Integer id) {
		List<Actives> result=eventRegistRepository.findActivesByUserid(id);
		if(result!=null) {
			return result;
		}return null;
	}
	
	
	public List<EventRegistrations> findAllByActiveId(Integer activeId) {
		List<EventRegistrations> result=eventRegistRepository.findAllByactives_activeID(activeId);
		if(result!=null) {
			return result;
		}
		return null;
	}



	

}
