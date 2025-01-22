package lk.ijse.assignment_01_jsp.controller.CategoryController;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.assignment_01_jsp.entity.Category;
import lk.ijse.assignment_01_jsp.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.io.IOException;

@WebServlet(value = "/updateCategory" , name = "updatecategory")
public class UpdateCategoryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("update");
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String description = req.getParameter("description");

        System.out.println("id: " + id + ", name: " + name + ", description: " + description);

        ServletContext context = req.getServletContext();
        SessionFactory sessionFactory = (SessionFactory) context.getAttribute("SessionFactory");
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Category category = new Category();
        category.setId(Long.parseLong(id));
        category.setName(name);
        category.setDescription(description);
        session.update(category);
        session.getTransaction().commit();
        session.close();
        resp.sendRedirect("addcategory");
    }


}
