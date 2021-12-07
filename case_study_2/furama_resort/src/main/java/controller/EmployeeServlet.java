package controller;

import bean.Employee;
import service.IEmployeeService;
import service.impl.EmployeeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = {"/index_employee"})
public class EmployeeServlet extends HttpServlet {
    private IEmployeeService service = new EmployeeService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createEmployee(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
            case "edit":
                editEmployee(request,response);
                break;
            case "search":
                break;
            default:
                break;
        }

    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int degree = Integer.parseInt(request.getParameter("degree"));
        int position = Integer.parseInt(request.getParameter("position"));
        int division = Integer.parseInt(request.getParameter("division"));
        Employee employee = new Employee(id,name,birthday,idCard,salary,phone,email,address,degree,position,division);
        service.editEmployee(employee);
        request.setAttribute("employee", service.showEmployee());
        request.getRequestDispatcher("employee_interaction.jsp").forward(request, response);
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        for (Employee employee : service.showEmployee()) {
            if (id == employee.getEmployee_id()) {
                service.deleteEmployee(employee);
            }
        }
        request.setAttribute("employee", service.showEmployee());
        request.getRequestDispatcher("employee_interaction.jsp").forward(request, response);
    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int degree = Integer.parseInt(request.getParameter("degree"));
        int position = Integer.parseInt(request.getParameter("position"));
        int division = Integer.parseInt(request.getParameter("division"));
        Employee employee = new Employee(id, name, birthday, idCard, salary, phone, email, address, degree, position, division);
        service.createEmployee(employee);
        request.setAttribute("employee", service.showEmployee());
        request.getRequestDispatcher("employee_interaction.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                request.getRequestDispatcher("create_employee.jsp").forward(request, response);
                break;
            case "delete":
                request.getRequestDispatcher("delete_employee.jsp").forward(request, response);
                break;
            case "edit":
                request.getRequestDispatcher("edit_employee.jsp").forward(request, response);
                break;
            default:
                getList(request, response);
                break;
        }
    }

    private void getList(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = service.showEmployee();
        if (employeeList == null) {
            request.setAttribute("msg", "No data to display ");
        } else {
            request.setAttribute("employee", employeeList);
        }
        try {
            request.getRequestDispatcher("employee_interaction.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
