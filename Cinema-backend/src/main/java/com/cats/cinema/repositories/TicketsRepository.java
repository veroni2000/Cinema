package com.cats.cinema.repositories;

import com.cats.cinema.entities.Screenings;
import com.cats.cinema.entities.Tickets;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface TicketsRepository  extends JpaRepository<Tickets,Long> {
  /*  @Query("INSERT INTO Tickets (screening, email) " +
            "VALUE (:screening, :email)")
    Optional<Screenings> findById(Long id);*/
}
