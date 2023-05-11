package sixteam.t6_14.model;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import sixteam.t6_14.model.Actives;
import sixteam.t6_14.model.ActivesRepository;


@Transactional
@Service
public class ActivesServiceImpl implements ActiveService {

	@Autowired
	private ActivesRepository activesRepository;
	@Autowired
	private EventRegistrationsRepository eRepository;
	
	@Autowired
	private MyFavoriteActiveRepository myFavRepository;

	
	public List<Actives> findAll() {
	return	 activesRepository.findAll();
	
	}

	
	public Actives findById(Integer id) {
		Optional<Actives> optional = activesRepository.findById(id);
		return optional.get();
	}

	
	public void delete(Integer id) {
		Actives actives=activesRepository.findById(id).get();
		if(actives!=null) {
			List<EventRegistrations> eventRegistrations=eRepository.findByActives(actives);
			List<MyFavoriteActives> myFav=myFavRepository.findByactive(actives);
			if(eventRegistrations!=null) {
				for (EventRegistrations eventRegistration : eventRegistrations) {
					eventRegistration.setUsers(null);
				}
				if(myFav!=null) {
					for (MyFavoriteActives fav : myFav) {
						fav.setUser(null);
					}
			eRepository.deleteAll(eventRegistrations);
			myFavRepository.deleteAll(myFav);
			}
			activesRepository.delete(actives);
		}

	}}

	
	public Actives update(Actives active) {

		return activesRepository.save(active);
		

	}

	
	public Actives save(Actives active) {

		return activesRepository.save(active);
		

	}


	@Override
	public Actives findByActivesName(String name) {
		Optional<Actives> op=activesRepository.findByactiveName(name);
		if (op.isEmpty()) {
			return null;
		}
		return op.get();
	}
	@Override
	public List<Actives> findByTopThrNum(){
		Pageable top3=PageRequest.of(0, 3);
		return activesRepository.findTop3Orderby(top3);
	}


	@Override
	public Boolean isSignUpAllowed(Integer id) {
		Actives actives=	activesRepository.findById(id).get();
		if(actives!=null) {
		Integer result=	actives.getActiveParticipantNum()-actives.getActiveSignUpNumber();
		return result>0?true:false;
		}
		return null;
	}


	
	
	


	

}
