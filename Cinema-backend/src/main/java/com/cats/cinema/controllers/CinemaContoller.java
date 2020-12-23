package com.cats.cinema.controllers;

import com.cats.cinema.entities.Movies;
import com.cats.cinema.entities.Users;
import com.cats.cinema.entities.Roles;
import com.cats.cinema.repositories.UsersRepository;
import com.cats.cinema.repositories.MoviesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

//import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.Date;

@CrossOrigin(origins = "*", maxAge = 3600)
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
                                          @RequestParam(required = false) Roles role_id){
        boolean isNew = id == null;

        Users user = new Users(id,email,password,name,role_id);
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

    @DeleteMapping("/users/delete")
        public ResponseEntity<?> deleteUser(@RequestParam Long id){
            usersRepository.findByID(id).ifPresent(test -> usersRepository.delete(test));
            return ResponseEntity.ok("Успешно изтрит потребител! ");
        }


}
