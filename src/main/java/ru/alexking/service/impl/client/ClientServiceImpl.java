package ru.alexking.service.impl.client;

import ru.alexking.store.ClientDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.alexking.models.client.Client;
import ru.alexking.service.ClientService;

import java.util.List;

@Service
public class ClientServiceImpl implements ClientService {
    @Autowired
    private ClientDAO clientStorage;

    @Override
    public List<Client> values() {
        return clientStorage.values();
    }

    @Override
    public int add(Client client) {
        return clientStorage.add(client);
    }

    @Override
    public void edit(Client client) {
        clientStorage.edit(client);
    }

    @Override
    public void delete(int id) {
        clientStorage.delete(id);
    }

    @Override
    public Client get(int id) {
        return clientStorage.get(id);
    }
}
