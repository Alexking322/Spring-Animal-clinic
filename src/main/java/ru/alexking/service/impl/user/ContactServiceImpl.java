package ru.alexking.service.impl.user;

import ru.alexking.models.user.User;
import ru.alexking.store.ContactDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.alexking.models.user.Contact;
import ru.alexking.service.ContactService;

import java.util.List;

@Service
public class ContactServiceImpl implements ContactService {
    @Autowired
    private ContactDAO contactStorage;

    @Override
    public List<Contact> values() {
        return contactStorage.values();
    }

    @Override
    public int add(Contact contact) {
        return contactStorage.add(contact);
    }

    @Override
    public void edit(Contact contact) {
        contactStorage.edit(contact);
    }

    @Override
    public void delete(int id) {
        contactStorage.delete(id);
    }

    @Override
    public Contact get(int id) {
        return contactStorage.get(id);
    }

    @Override
    public List<Contact> getContacts(int userId) {
        return contactStorage.getContacts(userId);
    }

    @Override
    public boolean isContact(User currentUser, User userForeign) {
        return contactStorage.isContact(currentUser, userForeign);
    }

    @Override
    public boolean isContact(int userId, int contactId) {
        return contactStorage.isContact(userId, contactId);
    }
}
