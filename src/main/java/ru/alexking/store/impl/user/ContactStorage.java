package ru.alexking.store.impl.user;

import ru.alexking.models.user.Contact;
import ru.alexking.models.user.User;
import ru.alexking.store.ContactDAO;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ContactStorage implements ContactDAO {
    private final HibernateTemplate template;
    private final Logger log = Logger.getLogger(ContactStorage.class);

    @Autowired
    public ContactStorage(HibernateTemplate template) {
        this.template = template;
    }

    public List<Contact> values() {
        return (List<Contact>) this.template.find("from Contact");
    }

    public int add(Contact contact) {
        log.info("added new contact, contact id " + contact.getContact().getId() + ", user id " + contact.getUser().getId());
        return (int) this.template.save(contact);
    }

    public void edit(Contact contact) {
        log.info("edited contact, id " + contact.getId());
        this.template.update(contact);
    }

    public void delete(int id) {
        this.template.delete(get(id));
    }

    public Contact get(int id) {
        return this.template.get(Contact.class, id);
    }

    public List<Contact> getContacts(int userId) {
        return (List<Contact>) this.template.findByNamedQueryAndNamedParam("getContactsOfUser", "id", userId);
    }

    public boolean isContact(int userId, int contactId) {
        String [] names = {"userId", "contactId"};
        Integer[] values = {userId, contactId};
        return !this.template.findByNamedQueryAndNamedParam("isContact", names, values).isEmpty();
    }

    public boolean isContact(User currentUser, User userForeign) {
        return isContact(currentUser.getId(), userForeign.getId());
    }
}
