package com.cats.cinema.repositories;

import com.cats.cinema.entities.Movies;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MoviesRepository  extends JpaRepository<Movies,Long> {
}
