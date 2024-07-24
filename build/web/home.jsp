<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.entity.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Home</title>
</head>
<body>
    <h1>User: Home</h1>

    <c:if test="${not empty userobj}">
        <h1>Name: ${userobj.name}</h1>
        <h1>Email: ${userobj.email}</h1>
    </c:if>
</body>
</html>
