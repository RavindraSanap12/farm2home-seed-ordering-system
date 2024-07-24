<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agrigems: Register</title>
        <%@include file="allsources/allcss.jsp"%>
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
    <body style="background-color: #f0f1f2;">
        <%@include file="allsources/navbar.jsp"%>
        <div class="container p-5">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Resistration Page</h4>

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

                            <form action="register" method="post">
                                <div class="form-group mt-4">
                                    <label for="Name">Enter Full Name</label>
                                    <input type="text" class="form-control" name="fname" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
                                </div><div class="form-group">
                                    <label for="Email1">Email address</label>
                                    <input type="email" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
                                </div>
                                <div class="form-group">
                                    <label for="No">Phone No</label>
                                    <input type="number" class="form-control" name="phno" id="exampleInputPassword1" required="required">
                                </div> 
                                <div class="form-group">
                                    <label for="Password">Password</label>
                                    <input type="password" class="form-control" name="password" id="exampleInputPassword1" required="required">
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" name="check" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree terms & Condition</label>
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>                            
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <%@include file="allsources/footer.jsp"%>
        </div>
    </body>
</html>
