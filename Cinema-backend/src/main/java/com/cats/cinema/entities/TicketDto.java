package com.cats.cinema.entities;

public class TicketDto {

    private String email;
    private Long screening_id;

    public TicketDto() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Long getScreening_id() {
        return screening_id;
    }

    public void setScreening_id(Long screening_id) {
        this.screening_id = screening_id;
    }
}
