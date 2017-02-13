package ru.alexking.controllers.user;

import ru.alexking.enums.RoleType;
import ru.alexking.models.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ru.alexking.models.user.LoginData;
import ru.alexking.models.user.Role;
import ru.alexking.models.user.UserInfo;
import ru.alexking.service.UserService;

import java.sql.Timestamp;

@Controller
public class RegisterController {
    @Autowired
    private UserService userService;

    @RequestMapping(value="/user/register", method = RequestMethod.GET)
    public String registrationPage(){
        return "user/signUp";
    }

    @RequestMapping(value="/user/register_failed", method = RequestMethod.GET)
    public String registerFailedPage(ModelMap model){
        model.addAttribute("register_error", "This login is existing");
        return "user/signUp";
    }

    @RequestMapping(value="/user/new", method = RequestMethod.POST)
    public String registerUser(@ModelAttribute LoginData loginData, @ModelAttribute UserInfo userInfo){
        if(userService.userExist(loginData)) {
            return "redirect:register_failed";
        }

        String password = loginData.getPassword();
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        loginData.setPassword(passwordEncoder.encode(loginData.getPassword()));
        userInfo.setRegistrationTime(new Timestamp(System.currentTimeMillis()));

        User newUser = new User();
        Role role = new Role();
        role.setName(RoleType.ROLE_USER);
        newUser.setRole(role);
        newUser.setLoginData(loginData);
        newUser.setUserInfo(userInfo);

        int id = userService.add(newUser);

        User currentUser = this.userService.getCurrentUser();
        if (this.userService.isAdmin(currentUser)) return "redirect:/user/view/all";

        Authentication authentication = new UsernamePasswordAuthenticationToken(loginData.getLogin(), password);
        SecurityContextHolder.getContext().setAuthentication(authentication);
        return "redirect:/user/" + newUser.getLoginData().getLogin();
    }
}
