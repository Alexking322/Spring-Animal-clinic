package ru.alexking.service;

import ru.alexking.models.client.Animal;
import ru.alexking.models.client.Client;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface AnimalService {

    @Transactional(readOnly = true)
    List<Animal> values();

    int add(final Animal obj);

    void edit(final Animal obj);

    void delete(final int id);

    @Transactional(readOnly = true)
    Animal get(final int id);

    @Transactional(readOnly = true)
    List<Animal> getAnimalsByClient(Client client);

    @Transactional(readOnly = true)
    List<Animal> getAnimalsByClient(int clientId);
}
