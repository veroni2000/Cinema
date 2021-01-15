package com.cats.cinema.controllers;

import com.cats.cinema.entities.Roles;
import com.cats.cinema.entities.Screenings;
import com.cats.cinema.entities.Tickets;

import com.cats.cinema.repositories.TicketsRepository;
import com.cats.cinema.repositories.ScreeningsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("tickets")
public class TicketsController {
    @Autowired
    TicketsRepository ticketsRepository;
    @Autowired
    ScreeningsRepository screeningsRepository;
    public static String generateString() {
        String uuid = UUID.randomUUID().toString();
        return uuid;
    }

    @PostMapping("/save")
    public ResponseEntity<?> saveTicket(@RequestParam Long screening_id,
                                          @RequestParam String email){
        Screenings screening = new Screenings();
        try {
            screening = screeningsRepository.findById(screening_id).get();
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(e.getClass().getName(), HttpStatus.OK);
        }
         var code = generateString();
        Tickets ticket = new Tickets(screening,code,email);
        ticket = ticketsRepository.save(ticket);
        Map<String, Object> response = new HashMap<>();
        response.put("generatedId", ticket.getTicket_id());
        response.put("message", "Усепешно записан билет");

        return new ResponseEntity<>(response,HttpStatus.OK);
    }
}
