package repository.impl;

import bean.Employee;
import repository.IEmployeeRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    @Override
    public List<Employee> showEmployee() {
        List<Employee> employeeList = new ArrayList<>();
        try {
            PreparedStatement statement = BaseRepository.connection.prepareStatement("SELECT * FROM nhan_vien");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Employee employeeObj = new Employee();
                employeeObj.setEmployee_id(Integer.parseInt(resultSet.getString("ma_nhan_vien")));
                employeeObj.setEmployee_name(resultSet.getString("ho_ten"));
                employeeObj.setEmployee_birthday(resultSet.getString("ngay_sinh"));
                employeeObj.setEmployee_id_card(resultSet.getString("so_cmnd"));
                employeeObj.setEmployee_salary(Double.parseDouble(resultSet.getString("luong")));
                employeeObj.setEmployee_phone(resultSet.getString("so_dien_thoai"));
                employeeObj.setEmployee_email(resultSet.getString("email"));
                employeeObj.setEmployee_address(resultSet.getString("dia_chi"));
                employeeObj.setEducation_degree_id(Integer.parseInt(resultSet.getString("ma_trinh_do")));
                employeeObj.setPosition_id(Integer.parseInt(resultSet.getString("ma_vi_tri")));
                employeeObj.setDivision_id(Integer.parseInt(resultSet.getString("ma_bo_phan")));
                employeeList.add(employeeObj);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public List<Employee> searchEmployee(Employee employee) {
        return null;
    }

    @Override
    public void createEmployee(Employee employee) {
        try {
            PreparedStatement preparedStatement = BaseRepository.connection.prepareStatement
                    ("insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) " +
                            "values(?,?,?,?,?,?,?,?,?,?)");

            preparedStatement.setString(1, employee.getEmployee_name());
            preparedStatement.setString(2, employee.getEmployee_birthday());
            preparedStatement.setString(3, employee.getEmployee_id_card());
            preparedStatement.setDouble(4, employee.getEmployee_salary());
            preparedStatement.setString(5, employee.getEmployee_phone());
            preparedStatement.setString(6, employee.getEmployee_email());
            preparedStatement.setString(7, employee.getEmployee_address());
            preparedStatement.setInt(8, employee.getPosition_id());
            preparedStatement.setInt(9, employee.getEducation_degree_id());
            preparedStatement.setInt(10, employee.getDivision_id());

            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void deleteEmployee(Employee employee) {
        try {
            PreparedStatement statement = BaseRepository.connection.prepareStatement("delete from nhan_vien where ma_nhan_vien=?");
            statement.setInt(1, employee.getEmployee_id());

            statement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void editEmployee(Employee employee) {
        try {
            PreparedStatement statement = BaseRepository.connection.prepareStatement
                    ("update nhan_vien set ho_ten=?,ngay_sinh=?,so_cmnd=?,luong=?,so_dien_thoai=?,email=?,dia_chi=?,ma_vi_tri=?,ma_trinh_do=?,ma_bo_phan=?\n" +
                            "where ma_nhan_vien=?");

            statement.setString(1, employee.getEmployee_name());
            statement.setString(2, employee.getEmployee_birthday());
            statement.setString(3, employee.getEmployee_id_card());
            statement.setDouble(4, employee.getEmployee_salary());
            statement.setString(5, employee.getEmployee_phone());
            statement.setString(6, employee.getEmployee_email());
            statement.setString(7, employee.getEmployee_address());
            statement.setInt(8, employee.getPosition_id());
            statement.setInt(9, employee.getEducation_degree_id());
            statement.setInt(10, employee.getDivision_id());
            statement.setInt(11, employee.getEmployee_id());

            statement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
