package ru.alexking.store;

import ru.alexking.models.user.User;

import java.util.List;

public interface UserDAO extends Storage<User> {

    User findByLogin(final String login);

    List<User> findByCity(String city);

    List<User> findBySex(String sex);

    User findByAuth(String login, String password);

}
