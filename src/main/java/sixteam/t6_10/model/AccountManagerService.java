package sixteam.t6_10.model;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
@Transactional
public class AccountManagerService {
	
	@Autowired
	private AccountManagerRepository aRepo;
	
	public boolean checkLogin(String name,String pwd) {
		AccountManager resultBean = aRepo.findByUsernameAndPassword(name,pwd);
		if(resultBean!=null) {
			return true;
		}
		return false;
	}
	
	public boolean checkLogin(AccountManager accountManager) {
		String name = accountManager.getUsername();
		String pwd = accountManager.getPassword();
		AccountManager resultBean = aRepo.findByUsernameAndPassword(name,pwd);
		if(resultBean!=null) {
			return true;
		}
		return false;
	} 
	

}
