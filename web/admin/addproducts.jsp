<%@ page import="com.entity.User" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Add Products</title>
        <%@include file="allcss.jsp" %>
        <style>
            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }
            input[type=number] {
                -moz-appearance: textfield;
            }
            .container {
                margin-bottom: 6%;
            }
        </style>
    </head>
    <body style="background-color: #f0f1f2">
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

        <div class="container mt-5">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Add Product</h4>

                            <%-- Check if success message is not empty and not already displayed --%>
                            <c:if test="${not empty succmsg and Objects.isNull(sessionScope.successMessageDisplayed)}">
                                <p class="text-center text-success">${succmsg}</p>
                                <%-- Set a session attribute to mark that the message has been displayed --%>
                                <%
                                    session.setAttribute("successMessageDisplayed", true);
                                    session.removeAttribute("succmsg");
                                %>
                            </c:if>
                            <%-- Check if failed message is not empty and not already displayed --%>
                            <c:if test="${not empty failedmsg and Objects.isNull(sessionScope.failedMessageDisplayed)}">
                                <p class="text-center text-danger">${failedmsg}</p>
                                <%-- Set a session attribute to mark that the message has been displayed --%>
                                <%
                                    session.setAttribute("failedMessageDisplayed", true);
                                    session.removeAttribute("failedmsg");
                                %>
                            </c:if>

                            <form action="addproducts" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="productname">Product Name</label>
                                    <input type="text" name="pname" class="form-control" id="productname" aria-describedby="emailhelp">
                                </div>
                                <div class="form-group">
                                    <label for="farmername">Farmer Name</label>
                                    <input type="text" name="fname" class="form-control" id="farmername" aria-describedby="emailhelp">
                                </div>
                                <div class="form-group">
                                    <label for="productprice">Price</label>
                                    <input type="number" name="pprice" class="form-control" id="productprice">
                                </div>
                                <div class="form-group">
                                    <label for="productcategories">Product Categories</label>
                                    <select name="pcategories" class="form-control" id="productcategories">
                                        <option selected>--Select--</option>
                                        <option value="New">New Product</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="productstatus">Product Status</label>
                                    <select name="pstatus" class="form-control" id="productcategories">
                                        <option selected>--Select--</option>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="productiamge">Upload Photo</label>
                                    <input type="file" required name="pimage" class="form-control-file" id="productprice">
                                </div>
                                <button type="submit" class="btn btn-primary">Add</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
