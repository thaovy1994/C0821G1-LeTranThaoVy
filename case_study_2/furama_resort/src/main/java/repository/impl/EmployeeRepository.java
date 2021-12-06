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
            PreparedStatement statement = BaseRepository.connection.prepareStatement("SELECT * FROM case_study.nhan_vien;");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Employee employeeObj = new Employee();
                employeeObj.setEmployee_id(Integer.parseInt(resultSet.getString("id")));
                employeeObj.setEmployee_name(resultSet.getString("name"));
                employeeObj.setEmployee_birthday(resultSet.getString("birthday"));
                employeeObj.setEmployee_id_card(resultSet.getString("id_card"));
                employeeObj.setEmployee_salary(Double.parseDouble(resultSet.getString("salary")));
                employeeObj.setEmployee_phone(resultSet.getString("phone"));
                employeeObj.setEmployee_email(resultSet.getString("email"));
                employeeObj.setEmployee_address(resultSet.getString("address"));
                employeeObj.setEducation_degree_id(Integer.parseInt(resultSet.getString("degree")));
                employeeObj.setPosition_id(Integer.parseInt(resultSet.getString("position")));
                employeeObj.setDivision_id(Integer.parseInt(resultSet.getString("division")));
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

    }

    @Override
    public void deleteEmployee(Employee employee) {

    }

    @Override
    public void editEmployee(Employee employee) {

    }
}
