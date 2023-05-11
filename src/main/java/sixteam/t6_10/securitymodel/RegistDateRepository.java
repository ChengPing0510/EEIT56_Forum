
package sixteam.t6_10.securitymodel;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface RegistDateRepository extends JpaRepository<RegistDate, Integer> {
    Optional<RegistDate> findById(int id);
}