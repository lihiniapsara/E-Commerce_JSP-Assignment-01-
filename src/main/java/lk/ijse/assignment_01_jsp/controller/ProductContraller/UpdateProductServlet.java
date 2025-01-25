package lk.ijse.assignment_01_jsp.controller.ProductContraller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.assignment_01_jsp.entity.Category;
import lk.ijse.assignment_01_jsp.entity.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.io.IOException;

@WebServlet(name = "editProductServlet", value = "/updateProduct")
public class UpdateProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(req);
        String id = req.getParameter("pid");



       /* if (id == null || id.trim().isEmpty()) {
            throw new IllegalArgumentException("Product ID is missing or invalid.");
        }*/

        System.out.println("id" + id);


        System.out.println(id + "edit ..p.roduct");

        String name = req.getParameter("name");
        System.out.println("name " + name);
        String cid = req.getParameter("categoryId");
        String description = req.getParameter("description");
        String quantity = req.getParameter("quantity");
        String price = req.getParameter("price");

        ServletContext context = req.getServletContext();
        SessionFactory sessionFactory = (SessionFactory) context.getAttribute("SessionFactory");
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        Product product = session.get(Product.class, Long.parseLong(id));


        product.setName(name);
        product.setDescription(description);
        product.setCategory(session.get(Category.class, Long.parseLong(cid)));
        product.setQuantity(Integer.parseInt(quantity));
        product.setPrice(Double.parseDouble(price));
        session.update(product);
        session.getTransaction().commit();
        session.close();
        resp.sendRedirect("getProductList");
    }
}
