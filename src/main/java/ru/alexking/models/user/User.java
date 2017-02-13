package ru.alexking.models.user;

import ru.alexking.models.Base;

public class User extends Base {
    private UserInfo userInfo;
    private LoginData loginData;
    private Role role;

    public User(){}

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public LoginData getLoginData() {
        return loginData;
    }

    public void setLoginData(LoginData loginData) {
        this.loginData = loginData;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}
