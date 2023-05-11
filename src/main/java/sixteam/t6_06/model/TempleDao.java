package sixteam.t6_06.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;



//@Repository
//@Transactional
public interface TempleDao extends JpaRepository<TempleBean, Integer>{
	
	//先改成找40內方便測試
	@Query(value="select TOP 60 *  from Temple where phone Like '0%' and phone not like '%000%' order by templeId desc ",nativeQuery=true)
	public List<TempleBean> findAlltest();

}
