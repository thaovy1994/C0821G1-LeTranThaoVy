package service;

import bean.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> showCustomer();

    List<Customer> searchCustomer(String customer_name);

    boolean createCustomer(Customer customer);

    boolean deleteCustomer(Customer customer);

    boolean editCustomer(Customer customer);
}
