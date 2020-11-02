package com.cats.cinema.repositories;

import com.cats.cinema.entities.Screenings;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ScreeningsRepository  extends JpaRepository<Screenings,Long> {
}
