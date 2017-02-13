package ru.alexking.controllers.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ru.alexking.service.UserService;

@Controller
public class LoginController {
    @Autowired
    private UserService userService;

    @RequestMapping(value="/user/login", method = RequestMethod.GET)
    public String loginPage(){
        return "user/signIn";
    }

    @RequestMapping(value="/user/login_failed", method = RequestMethod.GET)
    public String loginErrorPage(ModelMap model){
        model.addAttribute("error", "Неверный логин/пароль");
        return "user/signIn";
    }
}
