package repository;

import bean.User;

import java.util.List;

public interface IUserRepository {
    public List<User> showUsers();
    public User findByICountry(String country);
}
