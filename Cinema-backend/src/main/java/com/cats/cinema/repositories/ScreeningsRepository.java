package com.cats.cinema.repositories;

import com.cats.cinema.entities.Screenings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Optional;

public interface ScreeningsRepository  extends JpaRepository<Screenings,Long> {


    @Query("FROM Screenings s WHERE s.screening_id = :id" )
    Optional<Screenings> findById(Long id);

    @Query("FROM Screenings s WHERE s.time >= CURRENT_DATE order by s.time asc")
    List<Screenings> findAllFuture();

//    @Query("FROM Screenings s WHERE s.time >= :date1  AND s.time <= :date2 ")
//    List<Screenings> weekly(@Param("date1") LocalDateTime date1 ,
//                            @Param("date2") LocalDateTime date2);
}
//SELECT *
//FROM screenings s
//WHERE s.time BETWEEN NOW() AND NOW() + INTERVAL '7'

//SELECT *
//FROM screenings s
//WHERE s.time >= CURRENT_DATE  AND s.time <= CURRENT_DATE + integer '7'