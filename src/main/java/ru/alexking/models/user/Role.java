package ru.alexking.models.user;

import ru.alexking.enums.RoleType;
import ru.alexking.models.Base;

public class Role extends Base {
    private RoleType name;

    public Role(){}

    public Role(RoleType name){
        this.name = name;
    }

    public RoleType getName() {
        return name;
    }

    public void setName(RoleType name) {
        this.name = name;
    }
}
