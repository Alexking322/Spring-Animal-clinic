package ru.alexking.store;

import ru.alexking.models.user.User;
import ru.alexking.models.user.Contact;

import java.util.List;

public interface ContactDAO extends Storage<Contact> {

    List<Contact> getContacts(int userId);

    boolean isContact(int userId, int contactId);

    boolean isContact(User currentUser, User userForeign);

}
