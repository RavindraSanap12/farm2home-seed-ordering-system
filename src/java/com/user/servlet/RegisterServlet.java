package com.user.servlet;

import com.DAO.UserDAOimpl;
import com.DB.DBConnect;
import com.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("fname");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String password = req.getParameter("password");
            String check = req.getParameter("check");

//            System.out.println(name+" "+email+" "+phno+" "+password+" "+check);
            User us = new User();
            us.setName(name);
            us.setEmail(email);
            us.setPh_no(phno);
            us.setPassword(password);

            HttpSession sesson = req.getSession();

            if (check != null) {
                UserDAOimpl dao = new UserDAOimpl(DBConnect.getConn());
                boolean f = dao.userRegister(us);
                if (f) {
//                    System.out.println("Registration Successfully..");
                    sesson.setAttribute("succmsg", "Registration Successfully..");
                    resp.sendRedirect("register.jsp");
                } else {
//                    System.out.println("Something wrong on server..");
                    sesson.setAttribute("failedmsg", "Something wrong on server..");
                    resp.sendRedirect("register.jsp");

                }
            } else {
//                System.err.println("Please Check Agree Terms & Condition");
                sesson.setAttribute("failedmsg", "Please Check Agree Terms & Condition");
                resp.sendRedirect("register.jsp");
            }
            
            

        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    public static void main(String[] args) {
        RegisterServlet rs = new RegisterServlet();
    }
}
