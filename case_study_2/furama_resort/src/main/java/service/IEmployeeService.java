package service;

import bean.Employee;

import java.util.List;
import java.util.Map;

public interface IEmployeeService {
    List<Employee> showEmployee();

    List<Employee> searchEmployee(String employee_name);

    Map<String,String> createEmployee(Employee employee);

    Map<String,String> deleteEmployee(Employee employee);

    Map<String,String> editEmployee(Employee employee);
}
