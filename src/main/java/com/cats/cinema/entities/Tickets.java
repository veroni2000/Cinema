package com.cats.cinema.entities;

import javax.persistence.*;

@Entity
@Table(name = "tickets")
public class Tickets {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long ticket_id;

    @ManyToOne()
    @JoinColumn(name = "user_id")
    private Users user;

    @OneToOne()
    @JoinColumn(name = "screening_id")
    private Screenings screening;

    @Column(name = "code")
    private String code;

    public Tickets() {
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

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
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
}
