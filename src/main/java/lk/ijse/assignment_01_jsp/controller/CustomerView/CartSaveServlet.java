package lk.ijse.assignment_01_jsp.controller.CustomerView;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.assignment_01_jsp.entity.Cart;
import lk.ijse.assignment_01_jsp.entity.Product;
import lk.ijse.assignment_01_jsp.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.io.IOException;
@WebServlet(name = "cartSave", value = "/cartSave")
public class CartSaveServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("dopost cartSave");
        String productId = req.getParameter("productId");
        String quantity = req.getParameter("quantity");
        String userId = req.getParameter("userId");

        System.out.println("ProductId: " + productId + ", Quantity: " + quantity + ", UserId: " + userId);

        ServletContext context = req.getServletContext();
        SessionFactory sessionFactory = (SessionFactory) context.getAttribute("SessionFactory");
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        Cart cart = new Cart();
        cart.setProduct(session.get(Product.class, Long.parseLong(productId)));
        cart.setQuantity(Integer.parseInt(quantity));
        cart.setUser(session.get(User.class, Long.parseLong(userId)));

        session.saveOrUpdate(cart);
        session.getTransaction().commit();
        session.close();

    }
}


