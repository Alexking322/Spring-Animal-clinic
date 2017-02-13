package ru.alexking.models.user;

import ru.alexking.models.Base;

import java.sql.Timestamp;

public class Message extends Base {
    private User recipient;
    private User sender;
    private String text;
    private Timestamp timeSend;
    
    public Message(){}
    
    public Message(User recipient, User sender, String textMessage, Timestamp timeSend){
    	this.recipient = recipient;
        this.sender = sender;
    	this.text = textMessage;
        this.timeSend = timeSend;
    }
    
    public User getRecipient() {
        return recipient;
    }

    public void setRecipient(User recipient) {
        this.recipient = recipient;
    }

    public User getSender() {
        return sender;
    }

    public void setSender(User sender) {
        this.sender = sender;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Timestamp getTimeSend() {
        return timeSend;
    }

    public void setTimeSend(Timestamp timeSend) {
        this.timeSend = timeSend;
    }
}
