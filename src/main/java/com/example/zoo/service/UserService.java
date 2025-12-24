package com.example.zoo.service;

import com.example.zoo.domain.user.User;

import java.util.List;

public interface UserService {

    User getById(Long id);

    User getByUsername(String username);

    User update(User user);

    User create(User user);

    User createAdmin(User user);

    void delete(Long id);

    boolean isAnimalOwner(Long userId, Long animalId);

    List<User> getAll();

}
