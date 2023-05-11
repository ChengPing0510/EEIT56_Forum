package sixteam.t6_21.model;

import java.util.List;

import javax.xml.crypto.Data;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface ClassRepository extends JpaRepository<ClassBean, Integer>{
	public List<ClassBean> findByclassType(String classType);
	
	@Modifying
	@Query("UPDATE ClassBean c SET c.classApplicant = c.classApplicant + :classquantity WHERE c.classId = :classId")
	public int updateClassApplicant(@Param("classquantity")int classquantity,@Param("classId")int classId);
	@Modifying
	@Query("UPDATE ClassBean c SET c.classApplicant = c.classApplicant - :classquantity WHERE c.classId = :classId")
	public int deleteClassApplicant(@Param("classquantity")int classquantity,@Param("classId")int classId);
	
	@Modifying
	@Query("SELECT c FROM ClassBean c ORDER BY c.classDate DESC")
	public List<ClassBean> findByClassDateOrderByAsc();
	
	@Modifying
	@Query("SELECT c FROM ClassBean c ORDER BY c.classApplicant DESC")
	public List<ClassBean> findByClassApplicantByAsc();
	
	

}
