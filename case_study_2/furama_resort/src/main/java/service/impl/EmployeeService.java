package service.impl;

import bean.Employee;
import repository.IEmployeeRepository;
import repository.impl.EmployeeRepository;
import service.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    IEmployeeRepository repository = new EmployeeRepository();
    @Override
    public List<Employee> showEmployee() {
        try {
            List<Employee> employeeList = repository.showEmployee();
            if (employeeList.size() == 0) {
                return null;
            }
            return employeeList;
        } catch (Exception e) {
            e.getMessage();
            return null;
        }
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
