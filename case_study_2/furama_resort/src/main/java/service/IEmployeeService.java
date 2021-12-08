package service;

import bean.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> showEmployee();

    List<Employee> searchEmployee(String employee_name);

    void createEmployee(Employee employee);

    void deleteEmployee(Employee employee);

    void editEmployee(Employee employee);
}
