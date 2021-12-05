package service;

import bean.User;

import java.util.List;

public interface IUserService {
    List<User> showUsers();

    void create(User user);

    List<User> findByCountry(String country);

    List<User> arrangeByName();
}
