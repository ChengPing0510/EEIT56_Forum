package tw.leonchen;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.core.Authentication;

import sixteam.t6_14.model.ActivesRepository;

@SpringBootTest
class DemoSpringBootProjectApplicationTests {
	@Autowired
	private Authentication authentication;
	@Autowired
	private  ActivesRepository aRepository;

	@Test
	void contextLoads() {
	}

}
