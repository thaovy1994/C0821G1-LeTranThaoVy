package repository;

import bean.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> showEmployee();

    List<Employee> searchEmployee(Employee employee);

    void createEmployee(Employee employee);

    void deleteEmployee(Employee employee);

    void updateEmployee(Employee employee);
}
