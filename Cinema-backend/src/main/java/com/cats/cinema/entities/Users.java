package com.cats.cinema.entities;

import javax.persistence.*;

@Entity
@Table(name = "users")
public class Users {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long user_id;

    @Column(name = "email")
    private String email;

    @Column(name = "password")
    private String password;

    @Column(name = "name")
    private String name;

    @ManyToOne()
    @JoinColumn(name = "role_id")
    private Roles role_id;

    public Users() {
    }

    public Users(Long id, String email, String password, String name, Roles role_id) {
        this.user_id = id;
        this.email = email;
        this.password = password;
        this.name = name;
        this.role_id = role_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setRole(String role) {
        this.role_id = role_id;
    }

    public Long getUser_id() {
        return user_id;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return name;
    }

    public Roles getRole() {
        return role_id;
    }
}
