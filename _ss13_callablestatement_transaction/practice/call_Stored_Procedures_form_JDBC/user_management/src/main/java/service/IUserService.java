package service;

import bean.User;

import java.util.List;

public interface IUserService {
    public List<User> showUsers();

    public User findByICountry(String country);

}
