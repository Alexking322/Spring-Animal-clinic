package ru.alexking.models.user;

import ru.alexking.models.Base;

import java.sql.Timestamp;

public class Feedback extends Base {
    private String text;
    private User sender;
    private Timestamp timeAdd;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public User getSender() {
        return sender;
    }

    public void setSender(User sender) {
        this.sender = sender;
    }

    public Timestamp getTimeAdd() {
        return timeAdd;
    }

    public void setTimeAdd(Timestamp timeAdd) {
        this.timeAdd = timeAdd;
    }
}
