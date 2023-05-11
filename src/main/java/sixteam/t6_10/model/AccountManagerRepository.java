package sixteam.t6_10.model;

import org.springframework.data.jpa.repository.JpaRepository;
//這傢伙就是Dao
public interface AccountManagerRepository extends JpaRepository<AccountManager, Integer> {
	public AccountManager findByUsernameAndPassword(String username,String password);
}
