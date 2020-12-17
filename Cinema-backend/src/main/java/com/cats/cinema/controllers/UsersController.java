package com.cats.cinema.controllers;

import com.cats.cinema.entities.Users;
import com.cats.cinema.entities.Roles;
import com.cats.cinema.repositories.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.Date;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("users")
public class UsersController {
    @Autowired
    UsersRepository usersRepository;
    @GetMapping("/all")
    public List<Users> getUsers()
    {
        return  usersRepository.findAll();
    }

    @GetMapping("/search/id")
    public ResponseEntity<?> getUserById(@RequestParam(required = false) Long id){
        Users user = null;
        try{
            user= usersRepository.findById(id).get();
        }catch (Exception i){
            return new ResponseEntity<>(i.getClass().getName(), HttpStatus.OK);
        }
        return new ResponseEntity<>(user, HttpStatus.OK);
    }

    @GetMapping("/search/page")
    public ResponseEntity<?>paginateUsers(@RequestParam(value = "currentPage",defaultValue = "1")int currentPage,
                                          @RequestParam(value = "perPage",defaultValue = "5")int perPage,
                                          @RequestParam String name){
        Pageable pageable = PageRequest.of(currentPage -1, perPage);
        Page<Users> users = usersRepository.findPageUsers(pageable, name.toLowerCase());

        Map<String, Object> response = new HashMap<>();
        response.put("users", users.getContent());
        System.out.println(users);
        response.put("currentPage", users.getNumber());
        response.put("totalItems", users.getTotalElements());
        response.put("totalPages", users.getTotalPages());

        return new ResponseEntity<>(response,HttpStatus.OK);
    }

    @PostMapping("/save")
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
