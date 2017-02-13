package ru.alexking.service.impl.security;

import ru.alexking.models.user.User;
import ru.alexking.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ru.alexking.models.user.LoginData;

import java.util.ArrayList;
import java.util.Collection;

@Service("customUserDetailsService")
public class CustomUserDetailsService implements UserDetailsService {
    @Autowired
    private UserService userService;

    @Override
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
        User user = userService.findByLogin(login);
        if(user==null)
            throw new UsernameNotFoundException("user not found");
        LoginData loginData = user.getLoginData();
        Collection<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
        list.add(new GrantedAuthorityImpl(user.getRole().getName().toString()));

        UserDetails userDetails = new org.springframework.security.core.userdetails.User(loginData.getLogin(), loginData.getPassword(), true, true, true, true, list);
        return userDetails;
    }
}
