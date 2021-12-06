package service;

import bean.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    List<User> selectAllUsers();

    User selectUser(int id);

    void insertUser(User user) throws SQLException;

    boolean deleteUser(int id) throws SQLException;

    boolean updateUser(User user) throws SQLException;

    User getUserById(int id);

    void insertUserStore(User user) throws SQLException;
}
