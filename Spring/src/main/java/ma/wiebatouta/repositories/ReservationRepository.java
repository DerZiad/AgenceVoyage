package ma.wiebatouta.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ma.wiebatouta.models.Reservation;
@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Long> {

}
