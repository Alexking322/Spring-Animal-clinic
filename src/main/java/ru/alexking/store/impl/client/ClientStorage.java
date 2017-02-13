package ru.alexking.store.impl.client;

import ru.alexking.models.client.Client;
import ru.alexking.store.ClientDAO;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Класс реализует работу со списком клиентов из БД
 */
@Repository
public class ClientStorage implements ClientDAO {
    private final HibernateTemplate template;
    private final Logger log = Logger.getLogger(ClientStorage.class);

    @Autowired
    public ClientStorage(HibernateTemplate template) {
        this.template = template;
    }

    public List<Client> values() {
        return (List<Client>) template.find("from Client");
    }

    public int add(Client client) {
        log.info("added client, id" + client.getId());
        return (int) template.save(client);
    }

    public void edit(Client client) {
        log.info("edited client, id" + client.getId());
        template.update(client);
    }

    public void delete(int id) {
        template.delete(get(id));
    }

    public Client get(int id) {
        return template.get(Client.class, id);
    }
}
