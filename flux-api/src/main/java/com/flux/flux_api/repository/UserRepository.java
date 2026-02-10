package com.flux.flux_api.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.flux.flux_api.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByLogin(String login);
}
