package com.cats.cinema.entities;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "movies")
public class Movies {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long movie_Id;

    @Column(name = "title")
    private String title;

    @Column(name = "date")
    private Date date;

    @Column(name = "description")
    private String description;

    @Column(name = "picture")
    private String picture;

    public Movies() {
    }

    public Movies(Long id, String title, Date date, String description) {
        this.movie_Id = id;
        this.title = title;
        this.date = date;
        this.description = description;
    }

    public Long getmovie_Id() {
        return movie_Id;
    }

    public void setId(Long id) {
        this.movie_Id = id;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }
}
