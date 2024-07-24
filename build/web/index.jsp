
<%@ page import="com.DAO.ProductDAOimpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.ProductDetails" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.User" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agrigems: Index</title>

        <%@include file="allsources/allcss.jsp"%>
        <style>
            .back-img {
                background: url("images/agri.png");
                height: 60vh;
                width: 100%;
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
            }
            .farm2home {
                font-size: 60px;
                text-shadow: 2px 2px 4px black;
                color: fuchsia;
            }
            .crd-ho:hover {
                background-color: #f7f7f7;
            }

        </style>
    </head>
    <body style="background-color:#f7f7f7;">

        <%
            User u = (User) session.getAttribute("userobj");
        %>
        <%@include file="allsources/navbar.jsp"%>
        <div class="container-fluid back-img">
            <h2 class="farm2home text-center p-4">Farm2HomeOrganics</h2>

        </div>

        <div class="container-fluid">
            <h3 class="text-center mt-2">Recent Product</h3>
            <div class="row m-1">

                <%
                ProductDAOimpl dao2 = new ProductDAOimpl(DBConnect.getConn());
                List<ProductDetails> list2 = dao2.getRecentProduct();
            
                for (ProductDetails b: list2)
                {
                %>


                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img src="products/<%= b.getPhoto()%>" style="width: 150px; height: 200px; border: 1px solid #4b515c" class="img-thumblin" alt=""/>
                            <p><%= b.getProductname() %></p>
                            <p><%= b.getFarmername() %></p>
                            <p>
                                <%
                                if(b.getCategory().equals("Old"))
                                {
                                %>
                                Categories: <%= b.getCategory() %></p>                                

                            <div class="row text-center">
                                <a href="viewproduct.jsp?id=<%=b.getId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
                                <a href="" class="btn btn-primary btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i><%= b.getPrice() %></a>
                            </div>
                            <%
                            }
                            else
                            {
                            %>
                            <p>Categories: <%= b.getCategory() %></p>
                            <div class="row text-center">
                                <a href="" class="btn btn-primary btn-sm ml-1"><i class="fas fa-cart-plus"></i> Add Cart</a>
                                <a href="viewproduct.jsp?id=<%=b.getId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                                <a href="" class="btn btn-primary btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i><%= b.getPrice() %></a>
                            </div>
                            <%
                            }
                            %>

                        </div>
                    </div>
                </div>

                <%
                }
                %>



            </div>

            <div class="text-center mt-2">
                <a href="allrecentproducts.jsp" class="btn btn-primary bt-sm text-white">View All</a>


            </div>

        </div>

        <hr>

        <div class="container-fluid">
            <h3 class="text-center mt-2">New Product</h3>
            <div class="row m-1">
                <%
                ProductDAOimpl dao = new ProductDAOimpl(DBConnect.getConn());
                List<ProductDetails> list = dao.getNewProduct();
                for (ProductDetails b: list)
                {
                %>
                <div class="col-md-3">

                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img src="products/<%= b.getPhoto()%>" style="width: 150px; height: 200px; border: 1px solid #4b515c" class="img-thumblin" alt=""/>
                            <p><%= b.getProductname() %></p>
                            <p><%= b.getFarmername() %></p>
                            <p>Categories: <%= b.getCategory() %></p>
                            <div class="row text-center">

                                <%
                                if(u==null)
                                {
                                %>
                                <a href="login.jsp" class="btn btn-primary btn-sm ml-1"><i class="fas fa-cart-plus"></i> Add Cart</a>

                                <%
                                }
                                else
                                {
                                %>
                                <a href="cartServlet" class="btn btn-primary btn-sm ml-1"><i class="fas fa-cart-plus"></i> Add Cart</a>

                                <%
                                }
                                %>
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

            <div class="text-center mt-2">
                <a href="allnewproducts.jsp" class="btn btn-primary bt-sm text-white">View All</a>


            </div>

        </div>

        <hr>

        <div class="container-fluid">
            <h3 class="text-center mt-2">Old Product</h3>
            <div class="row m-1">

                <%
               ProductDAOimpl dao3 = new ProductDAOimpl(DBConnect.getConn());
               List<ProductDetails> list3 = dao3.getOldProduct();
            
               for (ProductDetails b: list3)
               {
                %>


                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img src="products/<%= b.getPhoto()%>" style="width: 150px; height: 200px; border: 1px solid #4b515c" class="img-thumblin" alt=""/>
                            <p><%= b.getProductname() %></p>
                            <p><%= b.getFarmername() %></p>
                            <p>Categories: <%= b.getCategory()%>

                            <div class="row text-center">
                                <a href="viewproduct.jsp?id=<%=b.getId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
                                <a href="" class="btn btn-primary btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i><%= b.getPrice() %></a>
                            </div>




                        </div>

                    </div>
                </div>
                <%
                }
                %>

            </div>

            <div class="text-center mt-2">
                <a href="alloldproducts.jsp" class="btn btn-primary bt-sm text-white">View All</a>


            </div>

        </div>


        <%@include file="allsources/footer.jsp"%>
    </body>
</html>
