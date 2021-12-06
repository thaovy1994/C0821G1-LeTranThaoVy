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

@WebServlet(name = "EmployeeServlet", urlPatterns = {"","/index"})
public class EmployeeServlet extends HttpServlet {
    IEmployeeService service = new EmployeeService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createEmployee(request,response);
                break;
            case "search":
                break;
            case "delete":
                break;
            case "edit":
                break;
            default:
                break;
        }

    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("id");
        String birthday = request.getParameter("id");
        String idCard = request.getParameter("id");
        double salary = Double.parseDouble(request.getParameter("id"));
        String phone = request.getParameter("id");
        String email = request.getParameter("id");
        String address = request.getParameter("id");
        int degree = Integer.parseInt(request.getParameter("id"));
        int position = Integer.parseInt(request.getParameter("id"));
        int division = Integer.parseInt(request.getParameter("id"));
        Employee employee = new Employee(id,name,birthday,idCard,salary,phone,email,address,degree,position,division);
        service.createEmployee(employee);
        request.setAttribute("employee", service.showEmployee());
        request.getRequestDispatcher("employee_list.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                request.getRequestDispatcher("create.jsp").forward(request, response);
                break;
            case "edit":
                request.getRequestDispatcher("edit.jsp").forward(request, response);
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
            request.getRequestDispatcher("employee_list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
