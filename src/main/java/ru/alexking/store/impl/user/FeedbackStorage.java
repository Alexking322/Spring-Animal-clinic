package ru.alexking.store.impl.user;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import ru.alexking.models.user.Feedback;
import ru.alexking.store.FeedbackDAO;

import java.util.List;

@Repository
public class FeedbackStorage implements FeedbackDAO {
    private final HibernateTemplate template;
    private final Logger log = Logger.getLogger(FeedbackStorage.class);

    @Autowired
    public FeedbackStorage(HibernateTemplate template) {
        this.template = template;
    }

    public List<Feedback> values() {
        return (List<Feedback>) this.template.find("from Feedback");
    }

    public int add(Feedback feedback) {
        log.info("added feedback, sender id " + feedback.getSender().getId());
        return (int) this.template.save(feedback);
    }

    public void edit(Feedback feedback) {
        log.info("edited feedback, id " + feedback.getId());
        this.template.update(feedback);
    }

    public void delete(int id) {
        this.template.delete(get(id));
    }

    public Feedback get(int id) {
        return this.template.get(Feedback.class, id);
    }
}
