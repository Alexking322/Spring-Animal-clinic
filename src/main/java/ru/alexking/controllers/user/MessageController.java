package ru.alexking.controllers.user;

import org.springframework.web.bind.annotation.PathVariable;
import ru.alexking.models.user.Message;
import ru.alexking.models.user.User;
import ru.alexking.service.MessageService;
import ru.alexking.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Timestamp;

@Controller
public class MessageController {
    @Autowired
    private MessageService messageService;
    @Autowired
    private UserService userService;

    @RequestMapping(value="/user/message-dialogs", method = RequestMethod.GET)
    public String viewMessageDialogs(ModelMap model){
        User user = userService.getCurrentUser();
        model.addAttribute("messages", messageService.getIncomingMessages(user.getId()));
        return "user/userDialogMessages";
    }

    @RequestMapping(value="/user/account/message", method = RequestMethod.GET)
    public String messagePage(ModelMap model, @RequestParam("idMessage") int id){
        Message message = messageService.get(id);
        model.addAttribute("message", message);
        return "user/userMessage";
    }

    @RequestMapping(value="/user/{userLogin}/message", method = RequestMethod.GET)
    public String sendMessagePage(@PathVariable String userLogin, ModelMap model){
        model.addAttribute("recipient", userService.findByLogin(userLogin));
        return "user/userSendMessage";
    }

    @RequestMapping(value="/user/send/message", method = RequestMethod.POST)
    public String sendMessage(@RequestParam("recipientId") int recipientId, @RequestParam("textMessage") String text){
        User recipient = userService.get(recipientId);
        User sender = userService.getCurrentUser();

        Message message = new Message(recipient, sender, text, new Timestamp(System.currentTimeMillis()));
        messageService.add(message);
        return "redirect:/user/send/message?recipientId=" + recipientId;
    }
}
