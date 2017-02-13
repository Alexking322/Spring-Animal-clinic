package ru.alexking.service.impl.user;

import ru.alexking.enums.RoleType;
import ru.alexking.models.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import ru.alexking.models.user.LoginData;
import ru.alexking.service.UserService;
import ru.alexking.store.UserDAO;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    private final UserDAO userStorage;

    @Autowired
    public UserServiceImpl(UserDAO userStorage){
        this.userStorage = userStorage;
    }

    @Override
    public List<User> values() {
        return userStorage.values();
    }

    @Override
    public int add(User user) {
        return userStorage.add(user);
    }

    @Override
    public void edit(User user) {
        userStorage.edit(user);
    }

    @Override
    public void delete(int id) {
        userStorage.delete(id);
    }

    @Override
    public User get(int id) {
        return userStorage.get(id);
    }

    @Override
    public User findByLogin(String login) {
        return userStorage.findByLogin(login);
    }

    @Override
    public List<User> findByCity(String city) {
        return userStorage.findByCity(city);
    }

    @Override
    public List<User> findBySex(String sex) {
        return userStorage.findBySex(sex);
    }

    @Override
    public User findByAuth(String login, String password) {
        return userStorage.findByAuth(login,password);
    }

    public boolean userExist(User user){
        return userStorage.findByLogin(user.getLoginData().getLogin())!=null;
    }

    public boolean userExist(LoginData loginData){
        return userStorage.findByLogin(loginData.getLogin())!=null;
    }

    public User getCurrentUser(){
        return this.userStorage.findByLogin(getCurrentUsername());
    }

    public String getCurrentUsername() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return auth.getName();
    }

    public boolean isAdmin(User user){
        if(user==null) return false;
        return user.getRole().getName().equals(RoleType.ROLE_ADMIN);
    }
}
