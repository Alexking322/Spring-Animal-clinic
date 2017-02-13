package ru.alexking.store.impl.user;

import ru.alexking.models.user.User;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import ru.alexking.store.UserDAO;

import java.util.List;

@Repository
public class UserStorage implements UserDAO {
	private final HibernateTemplate template;
    private final Logger log = Logger.getLogger(UserStorage.class);

	@Autowired
	public UserStorage(HibernateTemplate template) {
		this.template = template;
	}

    public List<User> values() {
        return (List<User>) template.find("from User");
    }

    public int add(User user) {
        log.info("added user, login " + user.getLoginData().getLogin());
        return (int) template.save(user);
    }

    public void edit(final User user) {
        log.info("edited user, id " + user.getId());
		template.update(user);
    }

    public void delete(int id) {
		template.delete(get(id));
    }

    public User get(int id) {
		return template.get(User.class, id);
    }

    public User findByLogin(final String login) {
        List<User> users = (List<User>) this.template.findByNamedQueryAndNamedParam("findByLogin", "login", login);
        return users.isEmpty() ? null : users.iterator().next();
	}

    public List<User> findByCity(String city){
		return (List<User>) this.template.findByNamedQueryAndNamedParam("findByCity", "city", city);
    }

    public List<User> findBySex(String sex){
        return (List<User>) this.template.findByNamedQueryAndNamedParam("findBySex", "sex", sex);
    }

    public User findByAuth(String login, String password){
        String [] names = {"login", "password"};
        String[] values = {login, password};
		List<User> users = (List<User>) this.template.findByNamedQueryAndNamedParam("findByAuth", names, values);
		return users.isEmpty() ? null : users.iterator().next();
    }
}
