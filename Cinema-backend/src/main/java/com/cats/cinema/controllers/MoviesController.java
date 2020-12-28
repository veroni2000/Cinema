package com.cats.cinema.controllers;

import com.cats.cinema.entities.Movies;
import com.cats.cinema.repositories.MoviesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("movies")
public class MoviesController {
    @Autowired
    MoviesRepository moviesRepository;
    @GetMapping("/all")
    public List<Movies> getMovies()
    {

        return  moviesRepository.findAll();
    }
    @PostMapping("/save")
    public ResponseEntity<?> saveOrUpdate(@RequestParam(required = false) Long id,
                                          @RequestParam(required = false) String title,
                                          @RequestParam(required = false) Date date){
        boolean isNew = id == null;

        Movies movie = new Movies(id,title,date);
        movie = moviesRepository.save(movie);
        Map<String, Object> response = new HashMap<>();
        response.put("Id", movie.getMovie_id());
        if(isNew) {
            response.put("message", "Успешно записан филм!");
        }else{
            response.put("message", "Успешно редактиран филм!");
        }
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
    @GetMapping("/search/id")
    public ResponseEntity<?> getMovieById(@RequestParam(required = false) Long id){
        Movies movie = null;
        try{
            movie= moviesRepository.findByID(id).get();
        }catch (Exception i){
            return new ResponseEntity<>(i.getClass().getName(), HttpStatus.OK);
        }
        return new ResponseEntity<>(movie, HttpStatus.OK);
    }
    @GetMapping("/search/page")
    public ResponseEntity<?>paginateMovies(@RequestParam(value = "currentPage",defaultValue = "1")int currentPage,
                                           @RequestParam(value = "perPage",defaultValue = "5")int perPage,
                                           @RequestParam String title){
        Pageable pageable = PageRequest.of(currentPage -1, perPage);
        Page<Movies> movies = moviesRepository.findPageMovies(pageable, title.toLowerCase());

        Map<String, Object> response = new HashMap<>();
        response.put("movies", movies.getContent());
        response.put("currentPage", movies.getNumber());
        response.put("totalItems", movies.getTotalElements());
        response.put("totalPages", movies.getTotalPages());

        return new ResponseEntity<>(response,HttpStatus.OK);
    }
}
