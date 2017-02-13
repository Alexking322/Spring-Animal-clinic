package ru.alexking.service.impl.client;

import ru.alexking.models.client.Animal;
import ru.alexking.models.client.Client;
import ru.alexking.service.AnimalService;
import ru.alexking.store.AnimalDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnimalServiceImpl implements AnimalService {
    @Autowired
    private AnimalDAO animalStorage;

    @Override
    public List<Animal> values() {
        return animalStorage.values();
    }

    @Override
    public int add(Animal obj) {
        return animalStorage.add(obj);
    }

    @Override
    public void edit(Animal obj) {
        animalStorage.edit(obj);
    }

    @Override
    public void delete(int id) {
        animalStorage.delete(id);
    }

    @Override
    public Animal get(int id) {
        return animalStorage.get(id);
    }

    @Override
    public List<Animal> getAnimalsByClient(Client client) {
        return getAnimalsByClient(client.getId());
    }

    @Override
    public List<Animal> getAnimalsByClient(int id) {
        return animalStorage.getAnimalsByClient(id);
    }
}
