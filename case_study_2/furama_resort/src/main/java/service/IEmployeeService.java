package service;

import bean.Employee;

import java.util.List;
import java.util.Map;

public interface IEmployeeService {
    List<Employee> showEmployee();

    List<Employee> searchEmployee(String employee_name);

    boolean createEmployee(Employee employee);

    void deleteEmployee(Employee employee);

    void editEmployee(Employee employee);
}
