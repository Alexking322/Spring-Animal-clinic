
//package com.clinic.store;
//
//import static org.junit.Assert.assertEquals;
//import static org.junit.Assert.assertNotNull;
//import org.junit.Test;
//import ru.alexking.models.client
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import org.springframework.test.context.web.WebAppConfiguration;
//import ru.alexking.models.user.Role;
//import ru.alexking.models.user.User;
//import ru.alexking.service.UserService;
//
//import java.security.Timestamp;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"classpath:spring-context.xml"})
//@WebAppConfiguration
//public class UserStorageTest {
//	@Autowired
//	private UserService userService;
//
//	@Test
//	public void testStorage(){
//
//User user = new User();
//		User sender = new User();
//
//		try {
//			Role roleAdmin = new Role("ROLE_ADMIN");
//			user.setRole(roleAdmin);
//			user.setLogin("login");
//			user.setEmail("test@mail.ru");
//			String password = userService.getHashMD5("password");
//			user.setPassword(password);
//			user.setName("name");
//			user.setSurname("surname");
//			user.setSex("man");
//			user.setPhoneNumber("911");
//			user.setCity("city");
//			Timestamp registerTime = new Timestamp(System.currentTimeMillis());
//			user.setRegistrationTime(registerTime);
//			final int id = userService.add(user);
//			user = userService.get(id);
//			assertNotNull(user);
//			assertEquals(registerTime, user.getRegistrationTime());
//
//			Role roleUser = new Role("ROLE_USER");
//			sender.setRole(roleUser);
//			sender.setLogin("loginSender");
//			sender.setEmail("testSender@mail.ru");
//			sender.setPassword(password);
//			sender.setName("nameSender");
//			sender.setSurname("surnameSender");
//			sender.setSex("man");
//			sender.setPhoneNumber("911");
//			sender.setCity("city");
//			Timestamp registerTimeSender = new Timestamp(System.currentTimeMillis());
//			sender.setRegistrationTime(registerTimeSender);
//			final int idSender = userService.add(sender);
//			sender = userService.get(idSender);
//			assertNotNull(sender);
//			assertEquals(registerTimeSender, sender.getRegistrationTime());
//
//			Message message = new Message(user, sender, "testText", new Timestamp(System.currentTimeMillis()));
//			List<Message> messageList = new ArrayList<Message>();
//			messageList.add(message);
//			sender.setOutgoingMessages(messageList);
//			userService.edit(sender);
//			user = userService.get(id);
//			assertNotNull(user.getIncomingMessages());
//			assertEquals(sender.getId(), user.getIncomingMessages().get(0).getSender().getId());
//
//			Feedback feedback = new Feedback();
//			feedback.setSender(sender);
//			feedback.setText("testFeedback");
//			Timestamp timeSendFeedback = new Timestamp(System.currentTimeMillis());
//			feedback.setTimeAdd(timeSendFeedback);
//			List<Feedback> feedbackList = new ArrayList<Feedback>();
//			feedbackList.add(feedback);
//			sender.setFeedbacks(feedbackList);
//			userService.edit(sender);
//			sender = userService.get(idSender);
//			assertNotNull(sender.getFeedbacks());
//			assertEquals(sender.getId(), sender.getFeedbacks().get(0).getSender().getId());
//			assertEquals(timeSendFeedback, sender.getFeedbacks().get(0).getTimeAdd());
//
//		}finally{
//			user.getIncomingMessages().clear();
//			userService.edit(user);
//			userService.delete(user.getId());
//			userService.delete(sender.getId());
//		}
//
//	}
//}
//
