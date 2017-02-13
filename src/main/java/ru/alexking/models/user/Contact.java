package ru.alexking.models.user;

import ru.alexking.models.Base;

import java.sql.Timestamp;

public class Contact extends Base {
    private User user;
    private User contact;
    private Timestamp dateAdd;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public User getContact() {
        return contact;
    }

    public void setContact(User contact) {
        this.contact = contact;
    }

    public Timestamp getDateAdd() {
        return dateAdd;
    }

    public void setDateAdd(Timestamp dateAdd) {
        this.dateAdd = dateAdd;
    }
}