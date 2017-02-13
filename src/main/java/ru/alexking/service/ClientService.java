package ru.alexking.service;

import ru.alexking.models.client.Client;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface ClientService {

    @Transactional(readOnly = true)
    List<Client> values();

    int add(final Client obj);

    void edit(final Client obj);

    void delete(final int id);

    @Transactional(readOnly = true)
    Client get(final int id);
}
