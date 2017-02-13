package ru.alexking.controllers.user;

import org.springframework.web.bind.annotation.PathVariable;
import ru.alexking.models.user.User;
import ru.alexking.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ru.alexking.models.user.Contact;
import ru.alexking.service.MessageService;
import ru.alexking.service.UserService;

import java.sql.Timestamp;
import java.util.List;

@Controller
public class ContactController {
    @Autowired
    private UserService userService;
    @Autowired
    private ContactService contactService;
    @Autowired
    private MessageService messageService;

    @RequestMapping(value="/user/contacts", method = RequestMethod.GET)
    public String allContactPage(ModelMap model){
        User currentUser = userService.getCurrentUser();
        List<Contact> contacts = contactService.getContacts(currentUser.getId());
        int contactsNumber = contactService.getContacts(currentUser.getId())
                .size();
        int messagesNumber = messageService.getIncomingMessages(currentUser.getId())
                .size();

        model.addAttribute("messagesNumber", messagesNumber);
        model.addAttribute("contactsNumber", contactsNumber);
        model.addAttribute("contacts", contacts);
        model.addAttribute("currentUser", currentUser);
        return "user/userContacts";
    }

    @RequestMapping(value="/user/contact/add", method = RequestMethod.POST)
    public String addContact(@RequestParam("id") final int id){
        User currentUser = userService.getCurrentUser();
        User newContact = userService.get(id);

        Contact contact = new Contact();
        contact.setContact(newContact);
        contact.setUser(currentUser);
        contact.setDateAdd(new Timestamp(System.currentTimeMillis()));

        contactService.add(contact);
        return "redirect:/user/" + newContact.getLoginData().getLogin();
    }

    @RequestMapping(value="/user/{userLogin}/contact/delete", method = RequestMethod.POST)
    public String deleteContact(@PathVariable final String userLogin, @RequestParam("contactId") int contactId){
        contactService.delete(contactId);
        return "redirect:/user/account/contacts";
    }
}
