package lk.ijse.assignment_01_jsp.controller.CustomerView;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.assignment_01_jsp.entity.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "getProductViceCategory", value = "/getProductViceCategory")
public class GetProductViceCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String id = req.getParameter("categoryId");
        System.out.println(id + " product ID");
        ServletContext servletContext = getServletContext();
        SessionFactory sessionFactory = (SessionFactory) servletContext.getAttribute("SessionFactory");
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List<Product> products = new ArrayList<>();
        try {
            products = session.createQuery("FROM Product WHERE category_id = :id", Product.class)
                    .setParameter("id", id)
                    .getResultList();
            for (Product product : products) {
                product.getName();
                System.out.println(product.getName()+" product name");
            }
        } catch (Exception e) {
            req.setAttribute("error", "Product not found");
        } finally {
            session.getTransaction().commit();
            session.close();
        }
        req.setAttribute("products", products);
        req.getRequestDispatcher("getAllcategoryForCustomer?categoryId=" + products.get(0).getCategory().getName()).forward(req, resp);
    }
}
