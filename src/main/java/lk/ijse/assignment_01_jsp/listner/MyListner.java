package lk.ijse.assignment_01_jsp.listner;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


@WebListener
public class MyListner implements ServletContextListener {
    private static SessionFactory sessionFactory;
    @Override
    public void contextInitialized(ServletContextEvent sce) {

        try {
            System.out.println("Initializing Hibernate");
            sessionFactory = new Configuration().configure().buildSessionFactory();
            sce.getServletContext().setAttribute("SessionFactory", sessionFactory);
            System.out.println("Hibernate initialized successfully");
        } catch (Throwable ex) {
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
}
