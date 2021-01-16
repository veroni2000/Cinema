package com.cats.cinema.controllers;

import com.cats.cinema.entities.Screenings;
import com.cats.cinema.entities.TicketDto;
import com.cats.cinema.entities.Tickets;
import com.cats.cinema.repositories.ScreeningsRepository;
import com.cats.cinema.repositories.TicketsRepository;
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
        return UUID.randomUUID().toString();
    }

    @PostMapping("/save")
    public ResponseEntity<?> saveTicket(@RequestBody TicketDto dto) {
        System.out.println(dto.getScreening_id() +" " + dto.getEmail());
        try {
            Screenings screening = screeningsRepository.findById(dto.getScreening_id()).get();
            var code = generateString();
            Tickets ticket = new Tickets(screening, code, dto.getEmail());
            ticket = ticketsRepository.save(ticket);
            Map<String, Object> response = new HashMap<>();
            response.put("generatedId", ticket.getTicket_id());
            response.put("message", "Успешно записан билет");

            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (Exception e) {

            e.printStackTrace();
            return new ResponseEntity<>(e.getClass().getName(), HttpStatus.OK);
        }
    }
}
