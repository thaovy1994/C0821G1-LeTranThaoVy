import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DiscountServlet", urlPatterns = "/discountServlet")
public class DiscountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String discount = request.getParameter("discount");
        try {
            int discount_Amount = (int) (Integer.parseInt(price) * Integer.parseInt(discount) * 0.01);
            request.setAttribute("discountAmount", discount_Amount);
            request.getRequestDispatcher("display-discount.jsp").forward(request, response);
        } catch (Exception e) {
            e.getMessage();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
