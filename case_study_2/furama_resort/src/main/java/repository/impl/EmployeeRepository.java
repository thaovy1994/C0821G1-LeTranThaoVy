package repository.impl;

import bean.Employee;
import repository.IEmployeeRepository;

import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    @Override
    public List<Employee> showEmployee() {
        List<Employee> employeeList = new ArrayList<>();
        
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
    public void updateEmployee(Employee employee) {

    }
}
