package ru.alexking.service;

import org.springframework.transaction.annotation.Transactional;
import ru.alexking.models.user.Role;

import java.util.List;

@Transactional
public interface RoleService {

    @Transactional(readOnly = true)
    List<Role> values();

    int add(final Role role);

    void edit(final Role role);

    void delete(final int id);

    @Transactional(readOnly = true)
    Role get(final int id);
}
