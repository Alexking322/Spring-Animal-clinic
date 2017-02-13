package ru.alexking.service;

import ru.alexking.models.user.User;
import org.springframework.transaction.annotation.Transactional;
import ru.alexking.models.user.Contact;

import java.util.List;

@Transactional
public interface ContactService {

    @Transactional(readOnly = true)
    List<Contact> values();

    int add(final Contact obj);

    void edit(final Contact obj);

    void delete(final int id);

    @Transactional(readOnly = true)
    Contact get(final int id);

    @Transactional(readOnly = true)
    List<Contact> getContacts(int userId);

    @Transactional(readOnly = true)
    boolean isContact(User currentUser, User userForeign);

    @Transactional(readOnly = true)
    boolean isContact(int userId, int contactId);
}
