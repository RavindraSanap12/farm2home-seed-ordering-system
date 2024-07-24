package com.user.servlet;

import com.DAO.UserDAOimpl;
import com.DB.DBConnect;
import com.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            UserDAOimpl dao = new UserDAOimpl(DBConnect.getConn());
            HttpSession session = req.getSession();

            String email = req.getParameter("email");
            String password = req.getParameter("password");

            if ("a@gmail.com".equals(email) && "admin".equals(password)) {
                // If admin login
                User adminUser = new User();  // You may want to create an admin user object
                adminUser.setName("Admin");
                session.setAttribute("userobj", adminUser);
                resp.sendRedirect("admin/home.jsp");
            } else {
                // For regular users
                User user = dao.login(email, password);
                if (user != null) {
                    session.setAttribute("userobj", user);
                    resp.sendRedirect("home.jsp");
                } else {
                    session.setAttribute("failedmsg", "Email & Password Invalid");
                    resp.sendRedirect("login.jsp");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
