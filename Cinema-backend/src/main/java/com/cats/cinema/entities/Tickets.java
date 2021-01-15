package com.cats.cinema.entities;

import javax.persistence.*;

@Entity
@Table(name = "tickets")
public class Tickets {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long ticket_id;

    @OneToOne()
    @JoinColumn(name = "screening_id")
    private Screenings screening;

    @Column(name = "code")
    private String code;

    @Column(name= "email")
    private String email;

    public Tickets() {
    }
    public Tickets(Screenings screening,String code, String email) {
        this.screening = screening;
        this.code = code;
        this.email = email;
    }
    public Tickets(String code) {
        this.code = code;
    }

    public Long getTicket_id() {
        return ticket_id;
    }

    public void setTicket_id(Long ticket_id) {
        this.ticket_id = ticket_id;
    }

    public Screenings getScreening() {
        return screening;
    }

    public void setScreening(Screenings screening) {
        this.screening = screening;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
