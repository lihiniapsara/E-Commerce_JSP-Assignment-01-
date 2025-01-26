package lk.ijse.assignment_01_jsp.controller.placeOrder;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.assignment_01_jsp.entity.OrderDetail;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "getAllOrders", value = "/getAllOrders")
public class GetAllOrders extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<OrderDetail> odList = new ArrayList<>();
        ServletContext context = req.getServletContext();
        SessionFactory sessionFactory = (SessionFactory) context.getAttribute("SessionFactory");
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        String hql = "SELECT od FROM OrderDetail od JOIN od.order o";
        odList = session.createQuery(hql, OrderDetail.class).getResultList();

        for (OrderDetail od : odList) {
            System.out.println("Order ID: " + od.getOrder().getId());
            System.out.println("Product ID: " + od.getProduct().getId());
            System.out.println("Quantity: " + od.getQuantity());
            System.out.println("Price: " + od.getPrice());
            System.out.println("Total: " + od.getOrder().getTotal());
            System.out.println("Customer ID: " + od.getOrder().getUser().getUserId());
        }

        session.getTransaction().commit();
        session.close();

        req.setAttribute("odList", odList);
        req.getRequestDispatcher("orderView.jsp").forward(req, resp);


    }
}
