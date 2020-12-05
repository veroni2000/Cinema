package com.cats.cinema.repositories;

import com.cats.cinema.entities.Roles;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RolesRepository extends JpaRepository<Roles,Long> {
}
