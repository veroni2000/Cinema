package com.cats.cinema.repositories;

import com.cats.cinema.entities.Screenings;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

public interface ScreeningsRepository extends JpaRepository<Screenings, Long> {


    @Query("FROM Screenings s WHERE s.screening_id = :id")
    Optional<Screenings> findById(Long id);

    @Query("FROM Screenings s WHERE s.time >= CURRENT_DATE order by s.time asc")
    List<Screenings> findAllFuture();

    @Query("FROM Screenings s WHERE s.time >= :date1 AND s.time <= :date2")
    List<Screenings> findAllForADay(Timestamp date1, Timestamp date2);

    @Query("Update Screenings s SET s.seats = :seats WHERE s.screening_id = :id")
    Screenings updateSeats(Integer seats, Long id);

}