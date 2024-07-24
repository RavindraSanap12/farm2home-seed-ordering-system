
;<%@ page import="com.entity.User" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Home</title>
        <%@include file="allcss.jsp" %>
        <style type="text/css">
            a {
                text-decoration: none;
                color: black;
            }
            a:hover {
                text-decoration: none;
                color: black;

            }

            .container {
                margin-bottom: 17%;
            }

        </style>
    </head>
    <body style="background-color: #f0f1f2;">
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

        <div class="container">
            <div class="row p-5">
                <div class="col-md-3">
                    <a href="addproducts.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-plus-square fa-3x text-primary"></i>
                                <h4>Add Product</h4>
                                -------------
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-3">
                    <a href="allproducts.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-cart-shopping fa-3x text-danger"></i>
                                <h4>All Product</h4>
                                -------------
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-3">
                    <a href="orders.jsp">                    
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-box-open fa-3x text-warning"></i>
                                <h4>Orders</h4>
                                -------------
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-3">
                    <a data-toggle="modal" data-target="#exampleModalCenter">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-sign-out-alt fa-3x text-primary"></i>
                                <h4>Logout</h4>
                                -------------
                            </div>
                        </div>
                    </a>
                </div>

            </div>

        </div>

        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="text-center">
                            <h4>Do You want Logout</h4>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <a href="logout" type="button" class="btn btn-primary text-white">Logout</a>
                        </div>
                    </div>
                    <div class="modal-footer">

                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
