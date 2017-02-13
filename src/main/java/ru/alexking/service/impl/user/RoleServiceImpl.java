package ru.alexking.service.impl.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.alexking.models.user.Role;
import ru.alexking.service.RoleService;
import ru.alexking.store.RoleDAO;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    RoleDAO roleStorage;

    @Override
    public List<Role> values() {
        return roleStorage.values();
    }

    @Override
    public int add(Role role) {
        return roleStorage.add(role);
    }

    @Override
    public void edit(Role role) {
        roleStorage.edit(role);
    }

    @Override
    public void delete(int id) {
        roleStorage.delete(id);
    }

    @Override
    public Role get(int id) {
        return roleStorage.get(id);
    }
}
