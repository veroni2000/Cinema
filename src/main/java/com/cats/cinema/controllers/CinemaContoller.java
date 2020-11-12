package com.cats.cinema.controllers;

import com.cats.cinema.entities.Movies;
import com.cats.cinema.entities.Users;
import com.cats.cinema.repositories.UsersRepository;
import com.cats.cinema.repositories.MoviesRepository;
import com.cats.cinema.repositories.TicketsRepository;
import com.cats.cinema.repositories.ScreeningsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

//import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.Date;

@RestController
@RequestMapping("cinema")
public class CinemaContoller {
    @Autowired
    UsersRepository usersRepository;
    @GetMapping("/users/all")
    public List<Users> getUsers()
    {

        return  usersRepository.findAll();
    }

    @GetMapping("/users/search/id")
    public String getUserById(@RequestParam(required = false) Long id){
        String user = null;
        try{
            user= usersRepository.findById(id).toString();
        }catch (Exception i){
            return i.getClass().getName();
        }
        return user;
    }

    @PostMapping("/users/save")
    public ResponseEntity<?> saveOrUpdate(@RequestParam(required = false) Long id,
                                          @RequestParam(required = false) String name,
                                          @RequestParam(required = false) String email,
                                          @RequestParam(required = false) String password,
                                          @RequestParam(required = false) String role){
        boolean isNew = id == null;

        Users user = new Users(id,email,password,name,role);
        user = usersRepository.save(user);
        Map<String, Object> response = new HashMap<>();
        response.put("Id", user.getUser_id());
        if(isNew) {
            response.put("message", "Успешно записан потребител!");
        }else{
            response.put("message", "Успешно редактиран потребител!");
        }
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    /*DeleteMapping("/delete")
        public ResponseEntity<?> deleteUser(@RequestParam String name,
                                            @RequestParam Long id){
        //...
            return ResponseEntity.ok("Успешно изтрит потребител! ");
        }*/

    @Autowired
    MoviesRepository moviesRepositiry;
    @GetMapping("/movies/all")
    public List<Movies> getMovies()
    {

        return  moviesRepositiry.findAll();
    }
    @PostMapping("/movies/save")
    public ResponseEntity<?> saveOrUpdate(@RequestParam(required = false) Long id,
                                          @RequestParam(required = false) String title,
                                          @RequestParam(required = false) Date date){
        boolean isNew = id == null;

        Movies movie = new Movies(id,title,date);
        movie = moviesRepositiry.save(movie);
        Map<String, Object> response = new HashMap<>();
        response.put("Id", movie.getMovie_id());
        if(isNew) {
            response.put("message", "Успешно записан филм!");
        }else{
            response.put("message", "Успешно редактиран филм!");
        }
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
}
