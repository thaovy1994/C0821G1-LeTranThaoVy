package repository.impl;

import bean.Customer;
import repository.ICustomerRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    @Override
    public List<Customer> showCustomer() {
        List<Customer> customerList = new ArrayList<>();
        try {
            PreparedStatement statement = BaseRepository.connection.prepareStatement("SELECT * FROM khach_hang");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Customer customerObj = new Customer();
                customerObj.setCustomer_id(Integer.parseInt(resultSet.getString("ma_khach_hang")));
                customerObj.setCustomer_name(resultSet.getString("ho_ten"));
                customerObj.setCustomer_birthday(resultSet.getString("ngay_sinh"));
                customerObj.setCustomer_gender(resultSet.getString("gioi_tinh"));
                customerObj.setCustomer_id_card(resultSet.getString("so_cmnd"));
                customerObj.setCustomer_phone(resultSet.getString("so_dien_thoai"));
                customerObj.setCustomer_email(resultSet.getString("email"));
                customerObj.setCustomer_address(resultSet.getString("dia_chi"));
                customerObj.setCustomer_type_id(Integer.parseInt(resultSet.getString("ma_loai_khach")));

                customerList.add(customerObj);
            }
        } catch (SQLException throwables) {
            System.out.println("Error");
        }
        return customerList;
    }

    @Override
    public List<Customer> searchCustomer(String customer_name) {
        List<Customer> customerList = new ArrayList<>();
        String new_name = "%" + customer_name + "%";
        try {
            PreparedStatement statement = BaseRepository.connection.prepareStatement("select * from khach_hang where ho_ten like ?");
            statement.setString(1, new_name);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Customer customerObj = new Customer();
                customerObj.setCustomer_id(Integer.parseInt(resultSet.getString("ma_khach_hang")));
                customerObj.setCustomer_name(resultSet.getString("ho_ten"));
                customerObj.setCustomer_birthday(resultSet.getString("ngay_sinh"));
                customerObj.setCustomer_gender(resultSet.getString("gioi_tinh"));
                customerObj.setCustomer_id_card(resultSet.getString("so_cmnd"));
                customerObj.setCustomer_phone(resultSet.getString("so_dien_thoai"));
                customerObj.setCustomer_email(resultSet.getString("email"));
                customerObj.setCustomer_address(resultSet.getString("dia_chi"));
                customerObj.setCustomer_type_id(Integer.parseInt(resultSet.getString("ma_loai_khach")));

                customerList.add(customerObj);
            }
        } catch (SQLException throwables) {
            System.out.println("Error");
        }
        return customerList;
    }

    @Override
    public void createCustomer(Customer customer) {
        try {
            PreparedStatement preparedStatement = BaseRepository.connection.prepareStatement
                    ("insert into khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) " +
                            "values(?,?,?,?,?,?,?,?)");

            preparedStatement.setString(1, customer.getCustomer_name());
            preparedStatement.setString(2, customer.getCustomer_birthday());
            preparedStatement.setString(3, customer.getCustomer_gender());
            preparedStatement.setString(4, customer.getCustomer_id_card());
            preparedStatement.setString(5, customer.getCustomer_phone());
            preparedStatement.setString(6, customer.getCustomer_email());
            preparedStatement.setString(7, customer.getCustomer_address());
            preparedStatement.setInt(8, customer.getCustomer_type_id());

            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            System.out.println("Error");
        }
    }

    @Override
    public void deleteCustomer(Customer customer) {
        try {
            PreparedStatement statement = BaseRepository.connection.prepareStatement("delete from khach_hang where ma_khach_hang=?");
            statement.setInt(1, customer.getCustomer_id());

            statement.executeUpdate();
        } catch (SQLException throwables) {
            System.out.println("Error");
        }
    }

    @Override
    public void editCustomer(Customer customer) {
        try {
            PreparedStatement statement = BaseRepository.connection.prepareStatement
                    ("update khach_hang set ho_ten=?,ngay_sinh=?,gioi_tinh=?,so_cmnd=?,so_dien_thoai=?,email=?,dia_chi=?,ma_loai_khach=?\n" +
                            "where ma_khach_hang=?");

            statement.setString(1, customer.getCustomer_name());
            statement.setString(2, customer.getCustomer_birthday());
            statement.setString(3, customer.getCustomer_gender());
            statement.setString(4, customer.getCustomer_id_card());
            statement.setString(5, customer.getCustomer_phone());
            statement.setString(6, customer.getCustomer_email());
            statement.setString(7, customer.getCustomer_address());
            statement.setInt(8, customer.getCustomer_type_id());
            statement.setInt(9, customer.getCustomer_id());

            statement.executeUpdate();
        } catch (SQLException throwables) {
            System.out.println("Error");
        }
    }
}
