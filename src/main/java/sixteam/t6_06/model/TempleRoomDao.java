package sixteam.t6_06.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TempleRoomDao extends JpaRepository<TempleRoomBean, Integer> {
	
	@Query(value="select * from templeroomforall order by roomId desc",nativeQuery=true)
	public List<TempleRoomBean> findAlltest();
	
	@Query(value="select * from templeroomforall where fk_templeId=?", nativeQuery=true)
	public List<TempleRoomBean> findByFk_templeId(int fk_templeId);
	
}
