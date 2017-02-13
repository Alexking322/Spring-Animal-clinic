package ru.alexking.store.impl.user;

import ru.alexking.models.user.Message;
import ru.alexking.store.MessageDAO;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MessageStorage implements MessageDAO {
	private final HibernateTemplate template;
	private final Logger log = Logger.getLogger(MessageStorage.class);

	@Autowired
	public MessageStorage(HibernateTemplate template) {
		this.template = template;
	}

	public List<Message> values() {
		return (List<Message>) this.template.find("from Message");
	}

	public int add(final Message message) {
		log.info("added message, recipient id " + message.getRecipient().getId() + ", sender id " + message.getSender().getId());
		return (int) this.template.save(message);
	}

	public void edit(final Message message) {
		log.info("edited message, id " + message.getId());
		this.template.update(message);
	}

	public void delete(final int id) {
		this.template.delete(get(id));
	}

	public Message get(final int id) {
		return this.template.get(Message.class, id);
	}

	public List<Message> getIncomingMessages(int id) {
		return (List<Message>) this.template.findByNamedQueryAndNamedParam("getIncomingMessages", "id", id);
	}

	public List<Message> getOutgoingMessages(int id) {
		return (List<Message>) this.template.findByNamedQueryAndNamedParam("getOutgoingMessages", "id", id);
	}

	public List<Message> getMessageByText(String text) {
		return (List<Message>) template.findByNamedQueryAndNamedParam("getMessageByText", "messageText", text);
	}

}
