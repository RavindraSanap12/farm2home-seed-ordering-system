<%@ page import="com.DAO.ProductDAOimpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.ProductDetails" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: All Products</title>
        <%@include file="allcss.jsp" %>

        <style>
            .table {
                margin-bottom: 17%;
            }
        </style>

    </head>
    <body>
        <%@include file="navbar.jsp" %>

        <% 
             response.setHeader("Cache-control", "no-cache, no-store");
             response.setHeader("Pragma", "no-cache");
             response.setHeader("Expires", "-1");

             HttpSession sessionObj = request.getSession();
             User user = (User) sessionObj.getAttribute("userobj");
             if (user == null) {
                 sessionObj.setAttribute("failedmsg", "Before continuing you have to login");

                 response.sendRedirect(request.getContextPath() + "/login.jsp");
             }
        %>
        <h3 class="text-center">Hello Admin</h3>

        <%-- Check if success message is not empty and not already displayed --%>
    <c:if test="${not empty succmsg and Objects.isNull(sessionScope.successMessageDisplayed)}">
        <h5 class="text-center text-success">${succmsg}</h5>
        <%-- Set a session attribute to mark that the message has been displayed --%>
        <%
            session.setAttribute("successMessageDisplayed", true);
            session.removeAttribute("succmsg");
        %>
    </c:if>
    <%-- Check if failed message is not empty and not already displayed --%>
    <c:if test="${not empty failedmsg and Objects.isNull(sessionScope.failedMessageDisplayed)}">
        <h5 class="text-center text-danger">${failedmsg}</h5>
        <%-- Set a session attribute to mark that the message has been displayed --%>
        <%
            session.setAttribute("failedMessageDisplayed", true);
            session.removeAttribute("failedmsg");
        %>
    </c:if>


    <table class="table table-striped">
        <thead class="bg-primary text-white">
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Image</th>
                <th scope="col">Product Name</th>
                <th scope="col">Farmer Name</th>
                <th scope="col">Price</th>
                <th scope="col">Categories</th>
                <th scope="col">Status</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                ProductDAOimpl dao = new ProductDAOimpl(DBConnect.getConn());
                List<ProductDetails> list = dao.getAllProducts();
                for(ProductDetails b : list)
                {
            %>
            <tr>
                <td><%= b.getId()%></td>
                <td><img src="../products/<%= b.getPhoto()%>" style="width: 50px; height: 50px;"></td>
                <td><%= b.getProductname()%></td>
                <td><%= b.getFarmername()%></td>
                <td><%= b.getPrice()%></td>
                <td><%= b.getCategory()%></td>
                <td><%= b.getStatus()%></td>
                <td>
                    <a href="editproducts.jsp?id=<%= b.getId()%>" class="btn btn-sm btn-primary"><i class="fas fa-edit"></i> Edit</a>
                    <a href="../deleteproducts?id=<%= b.getId()%>" class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i> Delete</a>
                </td>
            </tr>
            <%
            }
                
                
            %>   






        </tbody>
    </table>
    <div class="footer">
        <%@include file="footer.jsp"%>
    </div>
</body>
</html>
