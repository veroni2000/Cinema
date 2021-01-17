package com.cats.cinema.repositories;

import com.cats.cinema.entities.Tickets;
import org.springframework.data.jpa.repository.JpaRepository;


public interface TicketsRepository  extends JpaRepository<Tickets,Long> {
  /*  @Query("INSERT INTO Tickets (screening, email) " +
            "VALUE (:screening, :email)")
    Optional<Screenings> findById(Long id);*/
}
