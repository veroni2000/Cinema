package com.cats.cinema.entities;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "movies")
public class Movies {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long movie_id;

    @Column(name = "title")
    private String title;

    @Column(name = "date")
    private Date date;

    public Movies() {
    }

    public Movies(Long id, String title, Date date) {
        this.title = title;
        this.date = date;
    }

    public Long getMovie_id() {
        return movie_id;
    }

    public void setMovie_id(Long movie_id) {
        this.movie_id = movie_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
