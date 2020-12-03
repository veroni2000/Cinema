package com.cats.cinema.entities;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "screenings")
public class Screenings {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long screening_id;

    @ManyToOne()
    @JoinColumn(name = "movie_id")
    private Movies movie;

    @Column(name = "seats")
    private int seats;

    @Column(name = "time")
    private Timestamp time;

    public Screenings() {
    }

    public Screenings(int seats, Timestamp time) {
        this.seats = seats;
        this.time = time;
    }

    public Long getScreening_id() {
        return screening_id;
    }

    public void setScreening_id(Long screening_id) {
        this.screening_id = screening_id;
    }

    //
    public Movies getMovie() {
        return movie;
    }

    public void setMovie(Movies movie) {
        this.movie = movie;
    }

    public int getSeats() {
        return seats;
    }

    public void setSeats(int seats) {
        this.seats = seats;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }
}
