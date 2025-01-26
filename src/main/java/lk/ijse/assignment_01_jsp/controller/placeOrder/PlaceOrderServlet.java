package lk.ijse.assignment_01_jsp.controller.placeOrder;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.assignment_01_jsp.entity.OrderDetail;
import lk.ijse.assignment_01_jsp.entity.Orders;
import lk.ijse.assignment_01_jsp.entity.Product;
import lk.ijse.assignment_01_jsp.entity.User;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.io.IOException;
@WebServlet(name = "placeOrder", value = "/placeOrder")
public class PlaceOrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("uid");
        String productId = req.getParameter("pid");
        String quantity = req.getParameter("qty");
        String total = req.getParameter("total");
        String price = req.getParameter("price");


        System.out.println(price+" price.........");
        System.out.println(total+" tot.........");

        System.out.println(userId + " " + productId + " " + quantity + " " + total + " " + price);

        ServletContext context = req.getServletContext();
        SessionFactory sessionFactory = (SessionFactory) context.getAttribute("SessionFactory");
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        Orders order = new Orders();
        order.setTotal(Double.parseDouble(total));
        order.setUser(session.get(User.class, Long.parseLong(userId)));
        order.setTotal(Double.parseDouble(total));

        boolean isSave = orderSave(order, session);


        try {
            if (isSave) {
                boolean desQty = descreaseQty(Long.parseLong(productId), Integer.parseInt(quantity), session);
                if (desQty) {
                    boolean issaved2 = orderDetailSave( order.getId(), Long.parseLong(productId), Integer.parseInt(quantity), Double.parseDouble(price), session);
                    if (issaved2) {
                        session.getTransaction().commit();
                        session.close();
                        resp.sendRedirect("orderView.jsp");
                    }else {
                        session.getTransaction().rollback();
                        session.close();
                        resp.sendRedirect("orderView.jsp");
                    }
                }else {
                    session.getTransaction().rollback();
                    session.close();
                    resp.sendRedirect("orderView.jsp");
                }
            }else {
                session.getTransaction().rollback();
                session.close();
                resp.sendRedirect("orderView.jsp");
            }
        } catch (NumberFormatException e) {
            session.getTransaction().rollback();
            session.close();
            throw new RuntimeException(e);
        } catch (HibernateException e) {
            session.getTransaction().rollback();
            session.close();
            throw new RuntimeException(e);
        } catch (IOException e) {
            session.getTransaction().rollback();
            session.close();
            throw new RuntimeException(e);
        }
    }

    private boolean orderDetailSave(long id, long l, int i, double v, Session session) {
        boolean isSaved = false;
        try {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setOrder(session.get(Orders.class, id));
            orderDetail.setProduct(session.get(Product.class, l));
            orderDetail.setQuantity(i);
            orderDetail.setPrice(v);
            session.save(orderDetail);
            if (orderDetail.getId() != 0) {
                isSaved = true;
            }
        } catch (Exception e) {
            isSaved = false;
            e.printStackTrace();
        }
        return isSaved;}

    private boolean descreaseQty(long id, int qty, Session session) {
        boolean isDes = false;
        try {
            Product product = session.get(Product.class, id);
            product.setQuantity(product.getQuantity() - qty);
            session.update(product);
            isDes = true;
        } catch (Exception e) {
            e.printStackTrace();
            isDes = false;
        }
        return isDes;
    }

    private boolean orderSave(Orders orders, Session session) {
        boolean isSaved = false;

        try {
            session.save(orders);
            if (orders.getId() != 0) {
                isSaved = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            isSaved = false;
        }

        return isSaved;

    }
}
