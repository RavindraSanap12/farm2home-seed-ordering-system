
package com.admin.servlet;

import com.DAO.ProductDAOimpl;
import com.DB.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/deleteproducts")
public class ProductsDeleteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        try
        {
            int id = Integer.parseInt(req.getParameter("id"));
            
            ProductDAOimpl dao = new ProductDAOimpl(DBConnect.getConn());
            boolean f = dao.deleteProducts(id);
            
            HttpSession session = req.getSession();
            if (f) {
                session.setAttribute("succmsg", "Product Delete Successfully");
                resp.sendRedirect(req.getContextPath() + "/admin/allproducts.jsp");

            } else {
                session.setAttribute("failedmsg", "Something Wrong on Server");
                resp.sendRedirect(req.getContextPath() + "/admin/allproducts.jsp");

            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
    }
}
