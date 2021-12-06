package service.impl;

import bean.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    private IUserRepository repository = new UserRepository();
    @Override
    public void insertUser(User user) throws SQLException {
        repository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        User user = repository.selectUser(id);
        return user;
    }

    @Override
    public List<User> selectAllUsers() {
        try {
            List<User> userList = repository.selectAllUsers();
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
    public boolean deleteUser(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return false;
    }
}
