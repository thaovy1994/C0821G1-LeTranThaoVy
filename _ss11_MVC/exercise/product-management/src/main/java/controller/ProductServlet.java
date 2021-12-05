package controller;

import bean.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = {"", "/product_List"})
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();

    //Post dùng để edit, create, delete
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            default:
                break;
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        for (Product products : productService.findAll()) {
            if (id == products.getProductId()) {
                productService.delete(products);
            }
        }
        getListProduct(request, response);
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        Product products = new Product(id, name, price, amount);
        productService.edit(products);
        request.setAttribute("products", productService.findAll());
        request.getRequestDispatcher("list.jsp").forward(request, response);
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        Product products = new Product(id,name, price, amount);
        boolean isCreated = productService.save(products);
        if (isCreated) {
            request.setAttribute("msg", "Creating is successful");
        } else {
            request.setAttribute("msg", "Creating is unsuccessful");
        }
        request.setAttribute("products", productService.findAll());    //hiển thị list thêm mới
        request.getRequestDispatcher("list.jsp").forward(request, response);
    }

    //Get dùng để hiển thị danh sách
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";              //nếu rỗng thì sẽ vào default
        }
        switch (action) {            // khi dùng switch thì action ko đc null
            case "create":
                request.getRequestDispatcher("create_product.jsp").forward(request, response);
                break;
            case "edit":
                request.getRequestDispatcher("edit.jsp").forward(request, response);
                break;
            case "delete":
                request.getRequestDispatcher("delete.jsp").forward(request, response);
                break;
            default:
                getListProduct(request, response);
                break;
        }
    }

    private void getListProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> product = productService.findAll();           //truyền qua index.jsp
        if (product == null) {
            request.setAttribute("msg", "No data to display ");
        } else {
            request.setAttribute("products", product);
        }
        request.getRequestDispatcher("list.jsp").forward(request, response);
    }
}
