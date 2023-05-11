package sixteam.t6_21.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service
@Transactional
public class ClassService {
	@Autowired
	private ClassRepository cRepo;
	

	public ClassBean insert(ClassBean classBean) {
		return cRepo.save(classBean);
	}
	
	public ClassBean update(ClassBean classBean) {
		return cRepo.save(classBean);
	}
	public void deleteById(int id) {
		cRepo.deleteById(id);
	}
	public ClassBean findById(Integer id) {
		Optional<ClassBean> cp = cRepo.findById(id);
		//OptionaL為容器 會將回傳值放到這邊
		ClassBean c1 = null;
		//判斷容器有沒有東西
		if(cp.isPresent()) {
			//有的話 取得物件
			c1 = cp.get();
		}
		return c1;
	}

	public List<ClassBean> findAll(){
		return cRepo.findAll();

	}
	public List<ClassBean> findByclassType(String classType){
		return cRepo.findByclassType(classType);

	}
	
	public void updateClassApplicant(int classquantity,int classId) {
		cRepo.updateClassApplicant(classquantity,classId);
	}
	
	public void deleteClassApplicant(int classquantity,int classId) {
		cRepo.deleteClassApplicant(classquantity, classId);
	}

	public List<ClassBean> findByClassDateOrderByAsc(){
		return cRepo.findByClassDateOrderByAsc();
	}
	public List<ClassBean> findByClassApplicantByAsc(){
		return cRepo.findByClassApplicantByAsc();
	}
}
