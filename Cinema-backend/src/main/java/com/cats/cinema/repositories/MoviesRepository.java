package com.cats.cinema.repositories;

import com.cats.cinema.entities.Movies;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface MoviesRepository extends JpaRepository<Movies, Long> {

    @Query("SELECT m FROM Movies m " +
            "WHERE lower(m.title) " +
            "LIKE :#{(#title == null || #title.isEmpty())? '%' : '%'+#title+'%'} ")
    Page<Movies> findPageMovies(Pageable pageable, String title);

}
