package ru.alexking.controllers;

import ru.alexking.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ClinicController {
    @Autowired
    private UserService userService;

    @RequestMapping(value="/", method = RequestMethod.GET)
    public String toClinic(){
        return "redirect:/clinic/view";
    }

    @RequestMapping(value="/clinic/view", method = RequestMethod.GET)
    public String mainPage(ModelMap modelMap){
        modelMap.addAttribute("user", userService.getCurrentUser());
        return "clinic/clinicView";
    }
}
