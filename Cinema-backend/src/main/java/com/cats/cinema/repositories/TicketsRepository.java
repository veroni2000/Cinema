package com.cats.cinema.repositories;

import com.cats.cinema.entities.Tickets;
import org.springframework.data.jpa.repository.JpaRepository;


public interface TicketsRepository  extends JpaRepository<Tickets,Long> {

}
