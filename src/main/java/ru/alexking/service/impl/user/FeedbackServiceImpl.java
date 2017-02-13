package ru.alexking.service.impl.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.alexking.models.user.Feedback;
import ru.alexking.service.FeedbackService;
import ru.alexking.store.FeedbackDAO;

import java.util.List;

@Service
public class FeedbackServiceImpl implements FeedbackService {
    @Autowired
    FeedbackDAO feedbackStorage;

    @Override
    public List<Feedback> values() {
        return feedbackStorage.values();
    }

    @Override
    public int add(Feedback feedback) {
        return feedbackStorage.add(feedback);
    }

    @Override
    public void edit(Feedback feedback) {
        feedbackStorage.edit(feedback);
    }

    @Override
    public void delete(int id) {
        feedbackStorage.delete(id);
    }

    @Override
    public Feedback get(int id) {
        return feedbackStorage.get(id);
    }
}
