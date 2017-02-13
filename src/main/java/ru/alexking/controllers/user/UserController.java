package ru.alexking.controllers.user;

import org.springframework.web.bind.annotation.*;
import ru.alexking.models.user.User;
import ru.alexking.models.user.UserInfo;
import ru.alexking.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import ru.alexking.service.MessageService;
import ru.alexking.service.UserService;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private ContactService contactService;
    @Autowired
    private MessageService messageService;

    @RequestMapping(value="/user/account", method = RequestMethod.GET)
    public String currentAccountPage(ModelMap model){
        User user = userService.getCurrentUser();
        model.addAttribute("user", user);
        return "user/userAccount";
    }

    @RequestMapping(value="/user/view/all", method = RequestMethod.GET)
    public String allUsersPage(ModelMap model){
        model.addAttribute("users", userService.values());
        return "user/userAllList";
    }

    @RequestMapping(value="/user/{userLogin}", method = RequestMethod.GET)
    public String foreignUserPage(@PathVariable final String userLogin, ModelMap model){
        User ownerUser = userService.findByLogin(userLogin);
        User currentUser = userService.getCurrentUser();

        boolean myAccount = ownerUser.getId()==currentUser.getId();
        boolean isContact = contactService.isContact(currentUser, ownerUser);

        int contactsNumber = contactService.getContacts(currentUser.getId())
                .size();
        int messagesNumber = messageService.getIncomingMessages(currentUser.getId())
                .size();
        model.addAttribute("messagesNumber", messagesNumber);
        model.addAttribute("contactsNumber", contactsNumber);
        model.addAttribute("isContact", isContact);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("ownerUser", ownerUser);
        model.addAttribute("myAccount", myAccount);
        return "user/userView";
    }

    @RequestMapping(value="/user/edit-profile", method = RequestMethod.GET)
    public String editUserPage(ModelMap model){
        User user = userService.getCurrentUser();
        model.addAttribute("user", user);
        model.addAttribute("urlEdit", "/user/edit");
        return "user/userEdit";
    }

    @RequestMapping(value="/user/edit", method = RequestMethod.POST)
    public String editUser(@RequestParam("id") int userId, @ModelAttribute UserInfo userInfo){
        User user = userService.get(userId);
        userInfo.setRegistrationTime(user.getUserInfo().getRegistrationTime());
        user.setUserInfo(userInfo);
        userService.edit(user);
        return "redirect:/user/account";
    }
}
