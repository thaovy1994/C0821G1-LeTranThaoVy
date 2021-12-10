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
    public Map<String, String> createEmployee(Employee employee) {
        Map<String, String> errorList = new HashMap<>();
        if (employee.getEmployee_name().equals("")) {
            errorList.put("name", "Please input !");
        } else if (employee.getEmployee_salary() < 0) {
            errorList.put("salary", "Salary must be more than 0 ");
        } else if (!employee.getEmployee_id_card().matches("^[0-9]{9,12}+$")) {
            errorList.put("id_card", "Wrong format");
        } else {
            this.repository.createEmployee(employee);
        }
        return errorList;
    }

    @Override
    public Map<String, String> deleteEmployee(Employee employee) {
        Map<String, String> errorList = new HashMap<>();
        repository.deleteEmployee(employee);
        return errorList;
    }

    @Override
    public Map<String, String> editEmployee(Employee employee) {
        Map<String, String> errorList = new HashMap<>();
        repository.editEmployee(employee);
        return errorList;
    }

}
