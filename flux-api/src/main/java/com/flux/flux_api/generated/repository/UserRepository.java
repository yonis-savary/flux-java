package com.flux.flux_api.generated.repository;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import com.flux.flux_api.generated.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {
    Optional<User> findByLogin(String login);
}
