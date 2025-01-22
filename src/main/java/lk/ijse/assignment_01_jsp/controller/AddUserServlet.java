package lk.ijse.assignment_01_jsp.controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.assignment_01_jsp.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddUserServlet", value = "/adduser")
public class AddUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        System.out.println(name+" "+email+" "+password+" "+role);

        ServletContext context = req.getServletContext();
        SessionFactory sessionFactory = (SessionFactory) context.getAttribute("SessionFactory");
        Session session = null;

        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            User user = new User();
            user.setUserName(name);
            user.setEmail(email);
            user.setPassword(password);
            user.setRole(role);
            session.save(user);
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
        resp.sendRedirect("addUser");
    }

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

    }
}
