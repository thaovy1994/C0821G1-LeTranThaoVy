package controller;

import bean.Customer;
import service.ICustomerService;
import service.impl.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns ={"/index_customer"} )
public class CustomerServlet extends HttpServlet {
    ICustomerService service = new CustomerService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            case "edit":
                editCustomer(request, response);
                break;
            case "search":
                searchCustomer(request, response);
                break;
            default:
                break;
        }

    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        request.setAttribute("customer", service.searchCustomer(name));
        request.getRequestDispatcher("customer_interaction.jsp").forward(request, response);
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int type_customer = Integer.parseInt(request.getParameter("type_customer"));
        Customer customer = new Customer(id, name, birthday, idCard,gender,phone, email, address, type_customer);
        service.editCustomer(customer);
        request.setAttribute("customer", service.showCustomer());
        request.getRequestDispatcher("customer_interaction.jsp").forward(request, response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        for (Customer customer : service.showCustomer()) {
            if (id == customer.getCustomer_id()) {
                service.deleteCustomer(customer);
            }
        }
        request.setAttribute("customer", service.showCustomer());
        request.getRequestDispatcher("customer_interaction.jsp").forward(request, response);
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int type_customer = Integer.parseInt(request.getParameter("type_customer"));
        Customer customer = new Customer(id, name, birthday, idCard,gender,phone, email, address, type_customer);
        service.createCustomer(customer);
        request.setAttribute("customer", service.showCustomer());
        request.getRequestDispatcher("customer_interaction.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                request.getRequestDispatcher("create_customer.jsp").forward(request, response);
                break;
            case "delete":
                request.getRequestDispatcher("delete_customer.jsp").forward(request, response);
                break;
            case "edit":
                request.getRequestDispatcher("edit_customer.jsp").forward(request, response);
                break;
            default:
                getList(request, response);
                break;
        }
    }

    private void getList(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = service.showCustomer();
        if (customerList == null) {
            request.setAttribute("msg", "No data to display ");
        } else {
            request.setAttribute("customer", customerList);
        }
        try {
            request.getRequestDispatcher("customer_interaction.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
