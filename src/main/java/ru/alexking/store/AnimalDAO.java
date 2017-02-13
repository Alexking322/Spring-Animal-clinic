package ru.alexking.store;

import ru.alexking.models.client.Animal;

import java.util.List;

public interface AnimalDAO extends Storage<Animal> {

    List<Animal> getAnimalsByClient(int clientId);
}
