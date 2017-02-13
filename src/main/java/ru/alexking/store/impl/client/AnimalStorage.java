package ru.alexking.store.impl.client;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import ru.alexking.models.client.Animal;
import ru.alexking.store.AnimalDAO;

import java.util.List;

@Repository
public class AnimalStorage implements AnimalDAO {
    private final HibernateTemplate template;
    private final Logger log = Logger.getLogger(AnimalStorage.class);

    @Autowired
    public AnimalStorage(HibernateTemplate template) {
        this.template = template;
    }

    public List<Animal> values() {
        return (List<Animal>) template.find("from Animal");
    }

    public int add(Animal animal) {
        log.info("added animal, id" + animal.getId());
        return (int) template.save(animal);
    }

    public void edit(Animal animal) {
        log.info("edited animal, id" + animal.getId());
        template.update(animal);
    }

    public void delete(int id) {
        template.delete(get(id));
    }

    public Animal get(int id) {
        return template.get(Animal.class, id);
    }

    @Override
    public List<Animal> getAnimalsByClient(int id) {
        return (List<Animal>) this.template.findByNamedQueryAndNamedParam("getAnimalsByClient", "id", id);
    }
}
