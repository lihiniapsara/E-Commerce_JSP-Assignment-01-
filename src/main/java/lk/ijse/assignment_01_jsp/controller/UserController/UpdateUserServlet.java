package lk.ijse.assignment_01_jsp.controller.UserController;

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

@WebServlet(urlPatterns = "/updateUser" , name = "updateUser")
public class UpdateUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("update");
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String role = req.getParameter("role");

        System.out.println(id+" "+name+" "+email+" "+role);

        ServletContext context = req.getServletContext();
        SessionFactory sessionFactory = (SessionFactory) context.getAttribute("SessionFactory");
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        User user = new User();
        user.setUserId(Long.parseLong(id));
        user.setUserName(name);
        user.setEmail(email);
        user.setRole(role);
        session.update(user);
        session.getTransaction().commit();
        session.close();
        resp.sendRedirect("adduser");
    }

}
