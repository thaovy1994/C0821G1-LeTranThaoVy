package repository;

import bean.Customer;
import bean.Employee;

import java.util.List;

public interface ICustomerRepository {
    List<Employee> showCustomer();

    List<Employee> searchCustomer(Customer customer);

    void createCustomer(Customer customer);

    void deleteCustomer(Customer customer);

    void editCustomer(Customer customer);
}
}
