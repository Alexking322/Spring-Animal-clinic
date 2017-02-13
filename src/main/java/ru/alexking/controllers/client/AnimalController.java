package ru.alexking.controllers.client;

import ru.alexking.models.client.Animal;
import ru.alexking.models.client.Client;
import ru.alexking.service.AnimalService;
import ru.alexking.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AnimalController {
    @Autowired
    private ClientService clientService;
    @Autowired
    private AnimalService animalService;

    @RequestMapping(value="/client/deletePet", method = RequestMethod.POST)
    public String deletePet(@RequestParam("idPet") int idPet){
        Animal animal = animalService.get(idPet);
        Client client = animal.getClient();
        animalService.delete(idPet);
        return "redirect:edit?id=" + client.getId();
    }

    @RequestMapping(value="/client/addPet", method = RequestMethod.POST)
    public String addPet(@RequestParam("idClient") int id, @ModelAttribute Animal animal){
        Client client = clientService.get(id);
        animal.setClient(client);
        animalService.add(animal);
        return "redirect:edit?id=" + id;
    }
}
