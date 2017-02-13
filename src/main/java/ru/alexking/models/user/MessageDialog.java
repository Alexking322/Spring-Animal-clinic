package ru.alexking.models.user;

import ru.alexking.models.Base;

public class MessageDialog extends Base {
    private User recipient;
    private User sender;
    
    public MessageDialog(){}

    public User getSender() {
        return sender;
    }

    public void setSender(User sender) {
        this.sender = sender;
    }

    public User getRecipient() {
        return recipient;
    }

    public void setRecipient(User recipient) {
        this.recipient = recipient;
    }
}
