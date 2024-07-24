<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="com.DAO.ProductDAOimpl" %>
<%@ page import="com.entity.ProductDetails" %>
<%@ page import="com.DB.DBConnect" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Update Products</title>
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
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Edit Product</h4>

                         
                            <%
                                    int id = Integer.parseInt(request.getParameter("id"));
                                    ProductDAOimpl dao = new ProductDAOimpl(DBConnect.getConn());
                                    ProductDetails b = dao.getProductById(id);
                            %>

                            <form action="editproducts" method="post">
                                
                                <input type="hidden" name="id" value="<%=b.getId()%>">
                                <div class="form-group">
                                    <label for="productname">Product Name</label>
                                    <input type="text" value="<%= b.getProductname() %>" name="pname" class="form-control" id="productname" aria-describedby="emailhelp">
                                </div>
                                <div class="form-group">
                                    <label for="farmername">Farmer Name</label>
                                    <input type="text" value="<%= b.getFarmername() %>" name="fname" class="form-control" id="farmername" aria-describedby="emailhelp">
                                </div>
                                <div class="form-group">
                                    <label for="productprice">Price</label>
                                    <input type="number" value="<%= b.getPrice() %>" name="pprice" class="form-control" id="productprice">
                                </div>

                                <div class="form-group">
                                    <label for="pstatus">Product Status</label>
                                    <select name="pstatus" class="form-control" id="productcategories">
                                        <%
                                          if("Active".equals(b.getStatus()))
                                          {
                                        %>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                        <%      
                                        }
                                        else
                                        {
                                        %>
                                        <option value="Inactive">Inactive</option>
                                        <option value="Active">Active</option>

                                        <%
                                        }
                                        %>
                                    </select>
                                </div>

                                <button type="submit" class="btn btn-primary">Update</button>
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



