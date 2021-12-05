package service.impl;

import bean.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    private IUserRepository repository = new UserRepository();

    @Override
    public List<User> showUsers() {
        try {
            List<User> userList = repository.showUsers();
            if (userList.size() == 0) {
                return null;
            }
            return userList;
        } catch (Exception e) {
            e.getMessage();
            return null;
        }
    }

    @Override
    public void create(User user) {
        repository.create(user);
    }

    @Override
    public List<User> findByCountry(String country) {
        List<User> user = repository.findByCountry(country);
        return user;
    }

    @Override
    public List<User> arrangeByName() {
        List<User> userList = repository.arrangeByName();
        return userList;
    }

}
