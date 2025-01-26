package lk.ijse.assignment_01_jsp.controller;

import java.io.*;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import lk.ijse.assignment_01_jsp.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

@WebServlet(name = "login", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("login");

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        System.out.println(email + " " + password);

        ServletContext context = req.getServletContext();
        SessionFactory sessionFactory = (SessionFactory) context.getAttribute("SessionFactory");

        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();

            String hql = "FROM User WHERE email = :email AND password = :password";
            Query<User> query = session.createQuery(hql, User.class);
            query.setParameter("email", email);
            query.setParameter("password", password);

            User user = query.uniqueResult();

            session.getTransaction().commit();

            if (user != null) {
                HttpSession httpSession = req.getSession();
                String uid = String.valueOf(user.getUserId());
                httpSession.setAttribute("userId", uid);
                httpSession.setAttribute("role", user.getRole());
                if (user.getRole().equals("Admin")) {
                    resp.sendRedirect("admin_dashboard.jsp" + user.getUserId());
                } else {
                    resp.sendRedirect("getAllProductCustomerView?userId=" + user.getUserId());
                }
            } else {
                resp.sendRedirect("getAllProductCustomerView?LoginError=failed");
            }

        }catch(Exception e){
                resp.sendRedirect("getAllProductCustomerView?LoginError=failed");
                e.printStackTrace();

            }

        }



}