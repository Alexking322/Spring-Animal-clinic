package ru.alexking.service;

import ru.alexking.models.user.Message;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface MessageService {

    @Transactional(readOnly = true)
    List<Message> values();

    int add(final Message obj);

    void edit(final Message obj);

    void delete(final int id);

    @Transactional(readOnly = true)
    Message get(final int id);

    @Transactional(readOnly = true)
    List<Message> getIncomingMessages(int id);

    @Transactional(readOnly = true)
    List<Message> getOutgoingMessages(int id);

    @Transactional(readOnly = true)
    List<Message> getMessageByText(String text);
}
