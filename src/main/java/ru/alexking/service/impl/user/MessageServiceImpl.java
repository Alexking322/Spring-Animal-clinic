package ru.alexking.service.impl.user;

import ru.alexking.models.user.Message;
import ru.alexking.store.MessageDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.alexking.service.MessageService;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    private MessageDAO messageStorage;

    @Override
    public List<Message> values() {
        return messageStorage.values();
    }

    @Override
    public int add(Message message) {
        return messageStorage.add(message);
    }

    @Override
    public void edit(Message message) {
        messageStorage.edit(message);
    }

    @Override
    public void delete(int id) {
        messageStorage.delete(id);
    }

    @Override
    public Message get(int id) {
        return messageStorage.get(id);
    }

    @Override
    public List<Message> getIncomingMessages(int id) {
        return messageStorage.getIncomingMessages(id);
    }

    @Override
    public List<Message> getOutgoingMessages(int id) {
        return messageStorage.getOutgoingMessages(id);
    }

    @Override
    public List<Message> getMessageByText(String text) {
        return messageStorage.getMessageByText(text);
    }

}
