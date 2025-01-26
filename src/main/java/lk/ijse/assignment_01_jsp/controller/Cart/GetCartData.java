package lk.ijse.assignment_01_jsp.controller.Cart;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.assignment_01_jsp.entity.Cart;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "getCartData", value = "/getCartData")
public class GetCartData extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("cart data");
        List<Cart>cartList = new ArrayList<>();
        ServletContext context = req.getServletContext();
        SessionFactory sessionFactory = (SessionFactory) context.getAttribute("SessionFactory");
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        cartList = session.createQuery("from Cart").getResultList();
        for (Cart cart : cartList) {
            System.out.println(cart.getId()+ " : " + cart.getQuantity()+ "sasasasaasasa");
        }
        session.getTransaction().commit();
        session.close();
        req.setAttribute("cartList",cartList);
        req.getRequestDispatcher("getProductForCart").forward(req,resp);
    }
}
