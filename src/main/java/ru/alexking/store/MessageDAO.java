package ru.alexking.store;

import ru.alexking.models.user.Message;

import java.util.List;

public interface MessageDAO extends Storage<Message> {

    List<Message> getIncomingMessages(int id);

    List<Message> getOutgoingMessages(int id);

    List<Message> getMessageByText(String text);
}
