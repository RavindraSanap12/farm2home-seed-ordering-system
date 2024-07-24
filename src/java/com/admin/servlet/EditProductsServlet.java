package com.admin.servlet;

import com.DAO.ProductDAOimpl;
import com.DB.DBConnect;
import com.entity.ProductDetails;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/editproducts")
public class EditProductsServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String productname = req.getParameter("pname");
            String farmername = req.getParameter("fname");
            String price = req.getParameter("pprice");
            String status = req.getParameter("pstatus");

            ProductDetails b = new ProductDetails();
            b.setId(id);
            b.setProductname(productname);
            b.setFarmername(farmername);
            b.setPrice(price);
            b.setStatus(status);

            ProductDAOimpl dao = new ProductDAOimpl(DBConnect.getConn());
            boolean f = dao.updateEditProducts(b);

            HttpSession session = req.getSession();
            if (f) {
                session.setAttribute("succmsg", "Product Update Successfully");
                resp.sendRedirect(req.getContextPath() + "/admin/allproducts.jsp");

            } else {
                session.setAttribute("failedmsg", "Something Wrong on Server");
                resp.sendRedirect(req.getContextPath() + "/admin/allproducts.jsp");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
