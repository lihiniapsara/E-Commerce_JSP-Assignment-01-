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
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddCategoryServlet", value = "/addcategory")
public class AddCategoryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String description = req.getParameter("description");

        System.out.println(name+" "+description+"1");

        ServletContext context = req.getServletContext();
        SessionFactory sessionFactory = (SessionFactory) context.getAttribute("SessionFactory");
        Session session = null;

        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            Category category = new Category();
            category.setName(name);
            category.setDescription(description);
            session.save(category);
            session.getTransaction().commit();
        }catch (Exception e){
            if (session != null) {
                session.getTransaction().rollback();
            }
            throw new ServletException("Error adding user", e);
        }finally {
            if (session != null) {
                session.close();
            }
        }
        resp.sendRedirect("addcategory");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("category get");

        List<Category> categories = new ArrayList<>();

        try(Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce2","root","Ijse@1234");) {
           Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM category");

            while (resultSet.next()) {
                System.out.println("1234");
                Category category = new Category();
                category.setId(resultSet.getLong("id"));
                category.setName(resultSet.getString("name"));
                category.setDescription(resultSet.getString("description"));
                categories.add(category);
            }
            req.setAttribute("categories", categories);
            req.getRequestDispatcher("categoryManagement.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    /*
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("user get");
        List<User> users = new ArrayList<>();

        try(Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce2","root","Ijse@1234");) {
           Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM user");

            while (resultSet.next()) {
                System.out.println("123");
                User user = new User();
                user.setUserId(resultSet.getLong("userId"));
                user.setUserName(resultSet.getString("userName"));
                user.setEmail(resultSet.getString("email"));
                user.setRole(resultSet.getString("role"));
                users.add(user);
            }
            req.setAttribute("users", users);
            req.getRequestDispatcher("userManagement.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException("ERROR IN DATABASE");
        }

    }*/
}
