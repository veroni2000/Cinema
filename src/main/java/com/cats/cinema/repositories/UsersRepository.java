package com.cats.cinema.repositories;
import com.cats.cinema.entities.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface UsersRepository extends JpaRepository<Users,Long> {
    @Query("SELECT u FROM Users u WHERE u.user_id = :id" )
    Optional<Users> findByID(Long id);
}
