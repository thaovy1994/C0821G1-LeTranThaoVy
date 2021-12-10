package service.impl;

import bean.Employee;
import repository.IEmployeeRepository;
import repository.impl.EmployeeRepository;
import service.IEmployeeService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmployeeService implements IEmployeeService {
    private IEmployeeRepository repository = new EmployeeRepository();

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
    public List<Employee> searchEmployee(String employee_name) {
        return repository.searchEmployee(employee_name);
    }

    @Override
    public boolean createEmployee(Employee employee) {
        if (checkEmployee(employee)) {
            this.repository.createEmployee(employee);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public void deleteEmployee(Employee employee) {
        repository.deleteEmployee(employee);
    }

    @Override
    public void editEmployee(Employee employee) {
        repository.editEmployee(employee);
    }

    public boolean checkEmployee(Employee employee) {
        if (employee.getEmployee_id() < 0) {
            return false;
        }
        if (employee.getEmployee_name().equals("")) {
            return false;
        }
        if (employee.getEmployee_salary() < 0) {
            return false;
        }
        return true;
    }
}
