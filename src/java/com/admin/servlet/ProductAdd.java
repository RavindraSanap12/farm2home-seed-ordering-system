package com.admin.servlet;

import com.DAO.ProductDAOimpl;
import com.DB.DBConnect;
import com.entity.ProductDetails;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;

@WebServlet("/admin/addproducts")
@MultipartConfig
public class ProductAdd extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String productname = req.getParameter("pname");
            String farmername = req.getParameter("fname");
            String price = req.getParameter("pprice");
            String category = req.getParameter("pcategories");
            String status = req.getParameter("pstatus");
            Part part = req.getPart("pimage");
            String filename = part.getSubmittedFileName();

            ProductDetails b = new ProductDetails(productname, farmername, price, category, status, filename, "admin");

            ProductDAOimpl dao = new ProductDAOimpl(DBConnect.getConn());

                         

            boolean f = dao.addProducts(b);

            HttpSession session = req.getSession();

            if (f) {

                String path = getServletContext().getRealPath("") + "products";


                File file = new File(path);

                part.write(path + File.separator + filename);

                session.setAttribute("succmsg", "Product added Successfully");
                resp.sendRedirect(req.getContextPath() + "/admin/addproducts.jsp");
            } else {
                session.setAttribute("failedmsg", "Something wrong on Server");
                resp.sendRedirect(req.getContextPath() + "/admin/addproducts.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
