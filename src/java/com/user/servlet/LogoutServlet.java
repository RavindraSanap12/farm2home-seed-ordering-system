
package com.user.servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/admin/logout")
public class LogoutServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    {
        try
        {
            HttpSession session = req.getSession();
            session.removeAttribute("userobj");
            
            HttpSession session2 = req.getSession();
            session.setAttribute("succmsg", "Logout Successfully");
        resp.sendRedirect(req.getContextPath() + "/login.jsp");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
