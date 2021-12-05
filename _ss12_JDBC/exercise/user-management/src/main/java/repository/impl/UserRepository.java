package repository.impl;

import bean.User;
import repository.IUserRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    @Override
    public List<User> showUsers() {
        List<User> userList = new ArrayList<>();
        try {
            Statement statement = BaseRepository.connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select id,`name`,email,country\n" + "from users");

            User userObj;
            while (resultSet.next()) {
                userObj = new User();
                userObj.setId(Integer.parseInt(resultSet.getString("id")));
                userObj.setName(resultSet.getString("name"));
                userObj.setEmail(resultSet.getString("email"));
                userObj.setCountry(resultSet.getString("country"));
                userList.add(userObj);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return userList;
    }

    @Override
    public void create(User user) {
        try {
            PreparedStatement preparedStatement = BaseRepository.connection.prepareStatement
                    ("insert into users(name, email, country) values(?,?,?)");

            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());

            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<User> findByCountry(String country) {
        List<User> user = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseRepository.connection.prepareStatement
                    ("select id,`name`,email,country from users where country =?");
            preparedStatement.setString(1, country);
            ResultSet resultSet = preparedStatement.executeQuery();

            User userObj;
            while (resultSet.next()) {
                userObj = new User();
                userObj.setId(Integer.parseInt(resultSet.getString("id")));
                userObj.setName(resultSet.getString("name"));
                userObj.setEmail(resultSet.getString("email"));
                userObj.setCountry(resultSet.getString("country"));
                user.add(userObj);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> arrangeByName() {
        List<User> userList = new ArrayList<>();
        try {
            Statement statement = BaseRepository.connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM users\n" + "ORDER BY `name`");

            User userObj;
            while (resultSet.next()) {
                userObj = new User();
                userObj.setId(Integer.parseInt(resultSet.getString("id")));
                userObj.setName(resultSet.getString("name"));
                userObj.setEmail(resultSet.getString("email"));
                userObj.setCountry(resultSet.getString("country"));
                userList.add(userObj);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return userList;
    }

}
