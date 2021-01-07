package com.cats.cinema.repositories;

import com.cats.cinema.entities.Movies;
import com.cats.cinema.entities.Screenings;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;
import java.util.List;
import java.util.Optional;

public interface ScreeningsRepository  extends JpaRepository<Screenings,Long> {
    @Query("SELECT s FROM Screenings s WHERE s.screening_id = :id" )
    Optional<Screenings> findById(Long id);

    @Query("SELECT s FROM Screenings s WHERE s.time >= CURRENT_DATE")
    List<Screenings> findAllFuture();
}
