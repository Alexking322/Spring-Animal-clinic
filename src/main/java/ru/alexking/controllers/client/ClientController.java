package ru.alexking.controllers.client;

import ru.alexking.service.AnimalService;
import ru.alexking.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ru.alexking.models.client.Client;

import java.sql.Timestamp;

@Controller
public class ClientController {
    @Autowired
    private ClientService clientService;
    @Autowired
    private AnimalService animalService;

    @RequestMapping(value="/client/add", method = RequestMethod.GET)
    public String addClientPage(){
        return "client/clientAdd";
    }

    @RequestMapping(value="/client/add", method = RequestMethod.POST)
    public String addClient(@ModelAttribute Client client){
        client.setRegistrationTime(new Timestamp(System.currentTimeMillis()));
        clientService.add(client);
        return "redirect:view/all";
    }

    @RequestMapping(value="/client/edit", method = RequestMethod.GET)
    public String editClientPage(@RequestParam("id") int id, ModelMap model){
        Client client = clientService.get(id);
        model.addAttribute("client", client);
        model.addAttribute("pets", animalService.getAnimalsByClient(client));
        return "client/clientEdit";
    }

    @RequestMapping(value="/client/edit", method = RequestMethod.POST)
    public String editClient(@ModelAttribute Client newClient){
        Client client = clientService.get(newClient.getId());
        newClient.setRegistrationTime(client.getRegistrationTime());
        clientService.edit(newClient);
        return "redirect:edit?id=" + newClient.getId();
    }

    @RequestMapping(value="/client/delete", method = RequestMethod.GET)
    public String clientDeletePage(@RequestParam("id") int id){
        clientService.delete(id);
        return "redirect:view/all";
    }

    @RequestMapping(value="/client/view/all", method = RequestMethod.GET)
    public String clientAllListPage(ModelMap model){
        model.addAttribute("clients", clientService.values());
        return "client/clientAllList";
    }

}