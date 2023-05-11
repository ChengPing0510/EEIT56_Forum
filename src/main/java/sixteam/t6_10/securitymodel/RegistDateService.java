package sixteam.t6_10.securitymodel;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegistDateService {
	
	@Autowired
	RegistDateRepository rRepository;
	
	public List<RegistDate> showAllUserDate() {
		return rRepository.findAll();
	}
	
	public RegistDate showUserDate(int id) {
		return rRepository.findById(id).get();
	}
	
	public RegistDate saveUserDate(RegistDate uDate) {
		return rRepository.save(uDate);
	}
	
    public void removeUserDate(int id) {
        if (rRepository.findById(id).isPresent()) {
            rRepository.deleteById(id);
            System.out.println("有删");
        }
        System.out.println("過了");
    }
	
	public RegistDate addUser(RegistDate uDate) {
		return rRepository.save(uDate);
	}
	
	public RegistDate addUser(Integer id) {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String nowDate = sdFormat.format(date);
		System.out.println("==============0=============");
		if (rRepository.findById(id).isEmpty()||rRepository.findById(id)==null) {
			RegistDate uDate = new RegistDate(id,nowDate,nowDate,1);
			return rRepository.save(uDate);
		}
		RegistDate registDate = rRepository.findById(id).get();
		System.out.println("==============1=============");
		System.out.println(registDate.getId());
		System.out.println(registDate.getLastLogin());
		System.out.println(registDate.getRegistDate());
		System.out.println(registDate.getDays());
		
		if (registDate.getLastLogin()==null||!registDate.getLastLogin().equals(nowDate)) {
			System.out.println("===============2============");
			System.out.println("registDate.getLastLogin()"+registDate.getLastLogin());
			System.out.println("nowDate"+nowDate);
			if (registDate.getRegistDate()==null) {
				registDate.setRegistDate(nowDate);
			}
			if (registDate.getDays()==null) {
				registDate.setDays(1);
			}
			registDate.setLastLogin(nowDate);
			System.out.println("=============3==============");
			registDate.setDays(registDate.getDays()+1);	
		}
		System.out.println("rRepository.save(registDate)");
		System.out.println("================4===========");
		return rRepository.save(registDate);
	}
	
}
