<%@ page import="com.DAO.ProductDAOimpl" %>
<%@ page import="com.entity.ProductDetails" %>
<%@ page import="java.util.List" %>
<%@ page import="com.DB.DBConnect" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All New Products</title>
        <%@include file="allsources/allcss.jsp"%>
        <style>

            .crd-ho:hover {
                background-color: #f7f7f7;
            }
        </style>
    </head>
    <body style="background-color:#f7f7f7;">
        <%@include file="allsources/navbar.jsp"%>
        <h3 class="text-center mt-2">All New Products</h3>

        <div clas="container-fluid">
            <div class="row m-2">
                <%
              ProductDAOimpl dao = new ProductDAOimpl(DBConnect.getConn());
              List<ProductDetails> list = dao.getAllNewProduct();
              for (ProductDetails b: list)
              {
                %>
                <div class="col-md-3 pb-2">

                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img src="products/<%= b.getPhoto()%>" style="width: 150px; height: 200px; border: 1px solid #4b515c" class="img-thumblin" alt=""/>
                            <p><%= b.getProductname() %></p>
                            <p><%= b.getFarmername() %></p>
                            <p>Categories: <%= b.getCategory() %></p>
                            <div class="row text-center">
                                <a href="" class="btn btn-primary btn-sm ml-4"><i class="fas fa-cart-plus"></i> Add Cart</a>
                                <a href="viewproduct.jsp?id=<%=b.getId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                                <a href="" class="btn btn-primary btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i><%= b.getPrice() %></a>
                            </div>
                        </div>
                    </div>
                </div>

                <%
                }
                %>

            </div>

        </div>

    </body>
    <%@include file="allsources/footer.jsp"%>

</html>
