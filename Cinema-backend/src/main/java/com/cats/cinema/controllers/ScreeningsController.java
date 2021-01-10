package com.cats.cinema.controllers;

import com.cats.cinema.entities.Screenings;
import com.cats.cinema.repositories.ScreeningsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
    String str1 = String.format("%d-%02d-%02d %02d:%02d:%02d", year, month, day, hour, minute, second);
    String str2 = String.format("%d-%02d-%02d %02d:%02d:%02d", year, month, day + 7, hour, minute, second);

    @GetMapping("/all")
    public List<Screenings> getScreenings() {
        return screeningsRepository.findAll();
    }

    @GetMapping("/allFuture")
    public List<Screenings> getFutureScreenings() {
        return screeningsRepository.findAllFuture();
    }

//    @GetMapping("/weekly")
//    public List<Screenings> getWeeklyScreenings() {
//        return screeningsRepository.weekly(LocalDateTime.parse(str1,  DateTimeFormatter.ofPattern ( "yyyy-MM-dd HH:mm:ss" )), LocalDateTime.parse(str2,  DateTimeFormatter.ofPattern ( "yyyy-MM-dd HH:mm:ss" )));
//    }

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

}
