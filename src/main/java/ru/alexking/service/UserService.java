package ru.alexking.service;

import ru.alexking.models.user.User;
import org.springframework.transaction.annotation.Transactional;
import ru.alexking.models.user.LoginData;

import java.util.List;

@Transactional
public interface UserService {

    @Transactional(readOnly = true)
    List<User> values();

    int add(final User obj);

    void edit(final User obj);

    void delete(final int id);

    @Transactional(readOnly = true)
    User get(final int id);

    @Transactional(readOnly = true)
    User findByLogin(final String login);

    @Transactional(readOnly = true)
    List<User> findByCity(String city);

    @Transactional(readOnly = true)
    List<User> findBySex(String sex);

    @Transactional(readOnly = true)
    User findByAuth(String login, String password);

    boolean userExist(User user);

    boolean userExist(LoginData loginData);

    User getCurrentUser();

    String getCurrentUsername();

    boolean isAdmin(User user);
}
