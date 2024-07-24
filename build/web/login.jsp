<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@page import="com.DB.DBConnect"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agrigems: Login</title>
        <%@include file="allsources/allcss.jsp"%>

        <style>
            .container {
                margin-bottom: 17%;
            }
        </style>

    </head>
    <body style="background-color: #f0f1f2;">

        <%@include file="allsources/navbar.jsp"%>
        
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center">Login</h3>
                      
                          
                             <c:if test="${not empty failedmsg and Objects.isNull(sessionScope.failedMessageDisplayed)}">
                                <p class="text-center text-danger">${failedmsg}</p>
                                <%-- Set a session attribute to mark that the message has been displayed --%>
                                <%
                                    session.setAttribute("failedMessageDisplayed", true);
                                    session.removeAttribute("failedmsg");
                                %>
                            </c:if>   
                            
                            <c:if test="${not empty succmsg and Objects.isNull(sessionScope.failedMessageDisplayed)}">
                                <p class="text-center text-success">${succmsg}</p>
                                <%-- Set a session attribute to mark that the message has been displayed --%>
                                <%
                                    session.setAttribute("successMessageDisplayed", true);
                                    session.removeAttribute("succmsg");
                                %>
                            </c:if>   
                                
                                
                            <form action="login" method="post">
                                <div class="form-group mt-4">
                                    <label for="Email1">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp" required="required">
                                </div>
                                <div class="form-group">
                                    <label for="Password">Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" name="password" required="required">
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Login</button>
                                    <br>
                                    <a href="register.jsp">Create Account</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ page import="com.DB.DBConnect" %>

        <%
        DBConnect db = new DBConnect();
        %>
        <div class="footer">
            <%@include file="allsources/footer.jsp"%>
        </div>
    </body>
</html>
