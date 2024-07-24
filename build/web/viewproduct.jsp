<%@ page import="com.DAO.ProductDAOimpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.ProductDetails" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Details</title>
        <%@include file="allsources/allcss.jsp"%>

    </head>
    <body style="background-color: #f0f1f2;">
        <%@include file="allsources/navbar.jsp"%>
        <%
        int id = Integer.parseInt(request.getParameter("id"));
        ProductDAOimpl dao = new ProductDAOimpl(DBConnect.getConn());
        ProductDetails b = dao.getProductById(id);
        %>

        <div class="container p-4">
            <div class="row">
                <div class="col-md-6 text-center p-5 border bg-white">
                    <img src="products/<%=b.getPhoto()%>" style="height: 150px; width: 150px"><br>
                    <h4 class="mt-3">Product Name:<span class="text-success"><%=b.getProductname()%></span></h4>
                    <h4>Farmer Name:<span class="text-success"><%=b.getFarmername()%></span></h4>
                    <h4>Category:<span class="text-success"><%=b.getCategory()%></span></h4>
                </div>
                <div class="col-md-6 text-center p-5 border bg-white">
                    <h2><%=b.getProductname()%></h2>


                    <%
                    if("Old".equals(b.getCategory()))
                    {
                    %>
                    <h5 class="text-primary">Contact To Seller</h5>
                    <h5 class="text-primary"><i class="fas fa-envelope"></i> Email: <%= b.getUser_email()%></h5>
                    <%
                    }
                    %>

                    <div class="row">
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fas fa-money-bill-wave fa-2x"></i>
                            <p>Cash On Delivery</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fas fa-undo-alt fa-2x"></i>
                            <p>Return Available</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fas fa-truck-moving fa-2x"></i>
                            <p>Free Shipping</p>

                        </div>

                    </div>

                    <%
                    if("Old".equals(b.getCategory()))
                    {
                    %>
                    <div class="text-center p-3">
                        <a href="index.jsp" class="btn btn-primary"><i class="fas fa-cart-plus"></i>Continue Shopping</a>
                        <a href="" class="btn btn-primary"><i class="fa-solid fa-indian-rupee-sign"></i>200</a>
                    </div>                    
                    <%
                    }
                    else
                    {
                    %>
                    <div class="text-center p-3">
                        <a href="" class="btn btn-primary"><i class="fas fa-cart-plus"></i>Add Cart</a>
                        <a href="" class="btn btn-primary"><i class="fa-solid fa-indian-rupee-sign"></i>200</a>
                    </div>
                    <%
                    }
                    %>


                </div>
            </div>
        </div>
    </body>
    <%@include file="allsources/footer.jsp"%>

</html>
