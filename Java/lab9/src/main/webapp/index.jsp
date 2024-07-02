<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <style>
        body{
            display: flex;
            flex-direction: column;
        }
        .form{
            margin-top: 20px;
        }
    </style>
</head>
<body>
<a href="FirstServlet">1 task</a>
<a href="Login.jsp">2 task</a>
<form action="Servlet1" method="get">
    <button type="submit">5_1 task</button>
</form>
<form action="Servlet1" method="post">
    <button type="submit">5_2 task</button>
</form>
<form action="Servlet1_1" method="get" class="form">
    <input type="text" name="name" placeholder="name" />
    <input type="submit" value="6 task" />
</form>
</body>
</html>