package ma.wiebatouta.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ma.wiebatouta.models.Activite;
@Repository
public interface ActiviteRepository extends JpaRepository<Activite, Long> {
	
}