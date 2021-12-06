package repository.impl;

import bean.User;
import repository.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    @Override
    public List<User> selectAllUsers() {
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
    public void insertUser(User user) throws SQLException {
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
    public User selectUser(int id) {
        User user = null;
        try {
            PreparedStatement preparedStatement = BaseRepository.connection.prepareStatement
                    ("select id,`name`,email,country from users where id =?");
            preparedStatement.setInt(1, id);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try {
            PreparedStatement statement = BaseRepository.connection.prepareStatement
                    ("delete from users where id = ?");
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        } finally {
        }
        return rowDeleted;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try {
            PreparedStatement statement = BaseRepository.connection.prepareStatement
                    ("update users set name = ?,email= ?, country =? where id = ?");
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getCountry());
            statement.setInt(4, user.getId());

            rowUpdated = statement.executeUpdate() > 0;
        } finally {
        }
        return rowUpdated;
    }

    @Override
    public User getUserById(int id) {
        User user = null;
        String query = "{CALL get_user_by_id(?)}";
        try {
            //Create a statement using connection object
            CallableStatement callableStatement = BaseRepository.connection.prepareCall(query);
            callableStatement.setInt(1, id);

            //Execute the query or update query
            ResultSet rs = callableStatement.executeQuery();

            //Process the ResultSet object.
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        String query = "{CALL insert_user(?,?,?)}";

        try {
            CallableStatement callableStatement = BaseRepository.connection.prepareCall(query);
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());

            callableStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
