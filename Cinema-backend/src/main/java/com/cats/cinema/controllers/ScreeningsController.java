package com.cats.cinema.controllers;

import com.cats.cinema.entities.Screenings;
import com.cats.cinema.repositories.ScreeningsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("screenings")
public class ScreeningsController {
    @Autowired
    ScreeningsRepository screeningsRepository;
    @GetMapping("/all")
    public List<Screenings> getScreenings() {return screeningsRepository.findAll();}

    @GetMapping("/allFuture")
    public List<Screenings> getFutureScreenings() {return screeningsRepository.findAllFuture();}

    @GetMapping("/search/id")
    public ResponseEntity<?> getScreeningById(@RequestParam(required = false)Long id){
        Screenings screening = null;
        try{
            screening=screeningsRepository.findById(id).get();
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<>(e.getClass().getName(), HttpStatus.OK);
        }
        return new ResponseEntity<>(screening,HttpStatus.OK);
    }

}
