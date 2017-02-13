package ru.alexking.service;

import org.springframework.transaction.annotation.Transactional;
import ru.alexking.models.user.Feedback;

import java.util.List;

@Transactional
public interface FeedbackService {

    @Transactional(readOnly = true)
    List<Feedback> values();

    int add(final Feedback obj);

    void edit(final Feedback obj);

    void delete(final int id);

    @Transactional(readOnly = true)
    Feedback get(final int id);
}
