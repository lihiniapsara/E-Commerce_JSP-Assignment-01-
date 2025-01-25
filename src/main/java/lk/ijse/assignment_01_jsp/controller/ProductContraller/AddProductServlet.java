package lk.ijse.assignment_01_jsp.controller.ProductContraller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import lk.ijse.assignment_01_jsp.entity.Category;
import lk.ijse.assignment_01_jsp.entity.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
@WebServlet(name = "saveproduct", value = "/saveProduct")
public class AddProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("fy");
        String name = req.getParameter("name");
        String price = req.getParameter("price");
        String description = req.getParameter("description");
        long categoryId = Long.parseLong(req.getParameter("category"));
        String quantity = req.getParameter("quantity");

        System.out.println("name:"+name );
        System.out.println(categoryId);

        Part filePart = req.getPart("productImage"); // Retrieves <input type="file" name="productImage">
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // Get the file name

        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Save the file to the uploads directory
        filePart.write(uploadPath + File.separator + fileName);

        // Hibernate session to save product
        ServletContext context = req.getServletContext();
        SessionFactory sessionFactory = (SessionFactory) context.getAttribute("SessionFactory");
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        // Create and save the product
        Product product = new Product();
        product.setName(name);
        product.setDescription(description);
        product.setPrice(Double.parseDouble(price));
        product.setCategory(session.get(Category.class, categoryId));
        product.setQuantity(Integer.parseInt(quantity));
        product.setImageUrl(fileName);

        session.save(product);
        session.getTransaction().commit();
        session.close();

        // Redirect to product list page
        resp.sendRedirect("getProductList");
    }
    /*private Category getCobj(long category) {
        ServletContext context = getServletContext();
        SessionFactory sessionFactory = (SessionFactory) context.getAttribute("SessionFactory");
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Category category1 = session.get(Category.class, category);
        session.getTransaction().commit();
        session.close();
        return category1;
    }*/
}
