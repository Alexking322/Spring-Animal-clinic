package ru.alexking.controllers.user;

import ru.alexking.enums.RoleType;
import ru.alexking.models.user.User;
import ru.alexking.models.user.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ru.alexking.service.FeedbackService;
import ru.alexking.service.RoleService;
import ru.alexking.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private FeedbackService feedbackService;
    @Autowired
    private RoleService roleService;


    @RequestMapping(value = "/panel", method = RequestMethod.GET)
    public String adminPanelPage() {
        return "admin/adminPanel";
    }

    @RequestMapping(value="/edit/user", method = RequestMethod.GET)
    public String editUserPage(ModelMap model, @RequestParam("id") int id){
        model.addAttribute("user", userService.get(id));
        model.addAttribute("urlEdit", "/admin/edit/user");
        return "user/userEdit";
    }

    @RequestMapping(value="/edit/user", method = RequestMethod.POST)
    public String editUser(@ModelAttribute UserInfo userInfo, @RequestParam("id") int userId, @RequestParam("roleName") String roleName){
        User user = userService.get(userId);
        userInfo.setRegistrationTime(user.getUserInfo().getRegistrationTime());
        user.setUserInfo(userInfo);
        RoleType roleType = RoleType.valueOf(roleName);
        user.getRole().setName(roleType);
        userService.edit(user);
        return "redirect:/user/view/all";
    }

    @RequestMapping(value="/delete/user", method = RequestMethod.POST)
    public String editUser(@RequestParam("id") int id){
        userService.delete(id);
        return "redirect:/user/view/all";
    }

    @RequestMapping(value = "/delete/feedback", method = RequestMethod.POST)
    public String deleteFeedback(@RequestParam("id") int id) {
        feedbackService.delete(id);
        return "redirect:/clinic/view";
    }

}