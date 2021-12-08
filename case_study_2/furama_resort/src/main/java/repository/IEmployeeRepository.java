package repository;

import bean.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> showEmployee();

    List<Employee> searchEmployee(String employee_name);

    void createEmployee(Employee employee);

    void deleteEmployee(Employee employee);

    void editEmployee(Employee employee);
}
