package ru.alexking.store.impl.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import ru.alexking.models.user.Role;
import ru.alexking.store.RoleDAO;

import java.util.List;

@Repository
public class RoleStorage implements RoleDAO {
    private final HibernateTemplate template;

    @Autowired
    public RoleStorage(HibernateTemplate template) {
        this.template = template;
    }

    public List<Role> values() {
        return (List<Role>) this.template.find("from Role");
    }

    public int add(Role role) {
        return (int) this.template.save(role);
    }

    public void edit(Role role) {
        this.template.update(role);
    }

    public void delete(int id) {
        this.template.delete(get(id));
    }

    public Role get(int id) {
        return this.template.get(Role.class, id);
    }
}
