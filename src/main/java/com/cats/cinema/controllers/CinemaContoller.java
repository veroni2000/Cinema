package com.cats.cinema.controllers;

import com.cats.cinema.entities.Users;
import com.cats.cinema.repositories.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("cinema")
public class CinemaContoller {
    @Autowired
    UsersRepository usersRepository;
    @GetMapping("/all")
    public List<Users> getUsers()
    {
        return  usersRepository.findAll();
    }

}
