package ru.alexking.controllers.user;

import ru.alexking.models.user.User;
import ru.alexking.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ru.alexking.models.user.Feedback;
import ru.alexking.service.UserService;

import java.sql.Timestamp;

@Controller
public class FeedbackController {
    @Autowired
    private FeedbackService feedbackService;
    @Autowired
    private UserService userService;

    @RequestMapping(value="/clinic/send/feedback", method = RequestMethod.POST)
    public String sendFeedback(@RequestParam("feedbackText") String text){
        User user = userService.getCurrentUser();

        Feedback feedback = new Feedback();
        feedback.setSender(user);
        feedback.setText(text);
        feedback.setTimeAdd(new Timestamp(System.currentTimeMillis()));

        feedbackService.add(feedback);
        return "redirect:/clinic/view";
    }
}
