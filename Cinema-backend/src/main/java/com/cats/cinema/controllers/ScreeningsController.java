package com.cats.cinema.controllers;

import com.cats.cinema.entities.Screenings;
import com.cats.cinema.repositories.ScreeningsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("screenings")
public class ScreeningsController {
    @Autowired
    ScreeningsRepository screeningsRepository;

    LocalDateTime now = LocalDateTime.now();
    int year = now.getYear();
    int month = now.getMonthValue();
    int day = now.getDayOfMonth();
    int hour = now.getHour();
    int minute = now.getMinute();
    int second = now.getSecond();


    @GetMapping("/all")
    public List<Screenings> getScreenings() {
        return screeningsRepository.findAll();
    }

    @GetMapping("/allFuture")
    public List<Screenings> getFutureScreenings() {
        return screeningsRepository.findAllFuture();
    }


    @GetMapping("/search/id")
    public ResponseEntity<?> getScreeningById(@RequestParam(required = false) Long id) {
        Screenings screening = null;
        try {
            screening = screeningsRepository.findById(id).get();
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(e.getClass().getName(), HttpStatus.OK);
        }
        return new ResponseEntity<>(screening, HttpStatus.OK);
    }

    @GetMapping("/search/date")
    public ResponseEntity<?> getScreeningsByDate(@RequestParam(required = false) Timestamp date1, Timestamp date2) {
        List<Screenings> screenings = null;
        try {
            screenings = screeningsRepository.findAllForADay(date1, date2);
            return new ResponseEntity<>(screenings, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(e.getClass().getName(), HttpStatus.OK);
        }
    }

    @PostMapping("/seats")
    public ResponseEntity<?> updateSeats(@RequestParam(required = false) Integer seats, Long id) {
        try {
            screeningsRepository.updateSeats(seats, id);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getClass().getName(), HttpStatus.OK);
        }

    }
}
