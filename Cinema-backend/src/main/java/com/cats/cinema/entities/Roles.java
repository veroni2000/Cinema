package com.cats.cinema.entities;

import javax.persistence.*;
@Entity
@Table(name = "roles")
public class Roles {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long role_id;

    @Column(name = "role")
    private String role;

    public Long getRole_id() {
        return role_id;
    }

    public String getRole() {
        return role;
    }
}
