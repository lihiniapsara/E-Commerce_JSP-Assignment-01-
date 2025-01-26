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
import org.hibernate.query.Query;

import java.io.IOException;

@WebServlet(name = "ChangePassword", value = "/ChangePassword")
public class ChangePassword extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get the email and new password from the request
        String email = req.getParameter("email");
        String newPassword = req.getParameter("password");
        System.out.println("Email: " + email + ", New Password: " + newPassword);

        // Check if the fields are not empty
        if (email == null || email.isEmpty() || newPassword == null || newPassword.isEmpty()) {
            resp.getWriter().write("Email and password cannot be empty.");
            return;
        }

        // Get the SessionFactory from the ServletContext
        ServletContext context = req.getServletContext();
        SessionFactory sessionFactory = (SessionFactory) context.getAttribute("SessionFactory");

        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();

            // Fetch the user from the database
            Query<User> query = session.createQuery("FROM User WHERE email = :email", User.class);
            query.setParameter("email", email);
            User user = query.uniqueResult();

            if (user == null) {
                resp.getWriter().write("User not found.");
                return;
            }

            // Update the password
            user.setPassword(newPassword);

            // Update the user record
            session.update(user);
            session.getTransaction().commit();

            // Redirect or notify success
            resp.getWriter().write("Password updated successfully.");
            resp.sendRedirect("registration.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().write("An error occurred while updating the password.");
        }
    }


}
