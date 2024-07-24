
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: All Orders</title>
        <%@include file="allcss.jsp" %>
         
        <style>
            .table {
                margin-bottom: 17%;
            }
        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <h3 class="text-center">Hello Admin</h3>

        <table class="table table-striped">
            <thead class="bg-primary text-white">
                <tr>
                    <th scope="col">Order Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Address</th>
                    <th scope="col">Phone No</th>
                    <th scope="col">Product Name</th>
                    <th scope="col">Farmer</th>
                    <th scope="col">Price</th>
                    <th scope="col">Payment Type</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td> 
                    <td>Otto</td>
                    <td>Otto</td>
                    <td>@mdo</td> 
                    <td>Otto</td>
                    <td>Otto</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td> 
                    <td>Otto</td>
                    <td>Otto</td>
                    <td>@mdo</td> 
                    <td>Otto</td>
                    <td>Otto</td>

                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td> 
                    <td>Otto</td>
                    <td>Otto</td>
                    <td>@mdo</td> 
                    <td>Otto</td>
                    <td>Otto</td>

                </tr>
            </tbody>
        </table>
        <div class="footer">
            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
