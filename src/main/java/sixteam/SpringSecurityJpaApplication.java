package sixteam;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;

import sixteam.t6_06.model.TempleDao;
import sixteam.t6_06.model.TempleRoomDao;
import sixteam.t6_06.model.TempleRoomOrderDao;
import sixteam.t6_10.model.AccountManagerRepository;
import sixteam.t6_10.model.AccountRepository;
import sixteam.t6_10.securitymodel.UserRepository;
import sixteam.t6_21.model.ClassRepository;
import sixteam.t6_21.model.OrderItemRepository;
import sixteam.t6_21.model.OrderRepository;
import sixteam.t6_23.model.fraction.FractionRepository;
import sixteam.t6_23.model.matadata.MataDataRepository;
import sixteam.t6_23.model.matchcondition.MatchConditionRepository;
import sixteam.t6_23.model.matchsuccessdata.MatchSuccessDataRepository;
import sixteam.t6_23.model.people.PeopleRepository;
import sixteam.t6_23.model.usermatch.MatchRepository;
import sixteam.t6_27.model.CommentRepository;
import sixteam.t6_27.model.PostRepository;
import sixteam.t6_14.model.ActivesRepository;
import sixteam.t6_14.model.EventRegistrationsRepository;
import sixteam.t6_14.model.MyFavoriteActiveRepository;

@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true)
@SpringBootApplication
@EnableJpaRepositories(basePackageClasses = { MataDataRepository.class, MatchConditionRepository.class,MatchSuccessDataRepository.class,PeopleRepository.class,FractionRepository.class,MatchRepository.class,TempleRoomDao.class, TempleDao.class, TempleRoomOrderDao.class,
		  OrderRepository.class, OrderItemRepository.class, ClassRepository.class,
		  UserRepository.class, AccountRepository.class, AccountManagerRepository.class,
		  EventRegistrationsRepository.class, ActivesRepository.class, PostRepository.class, CommentRepository.class,MyFavoriteActiveRepository.class })
public class SpringSecurityJpaApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringSecurityJpaApplication.class, args);
	}

}