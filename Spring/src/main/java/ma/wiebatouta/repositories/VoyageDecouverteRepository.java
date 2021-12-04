package ma.wiebatouta.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ma.wiebatouta.models.VoyageDecouverte;
@Repository
public interface VoyageDecouverteRepository extends JpaRepository<VoyageDecouverte, Long> {

}
