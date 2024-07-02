<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Info</title>
    <style>
        body{
            display: flex;
            flex-direction: column;
        }
    </style>
</head>
<body>
    <h3>Welcome</h3>
    <p>${name}</p>
    <p>${status}</p>
    <p>${date}</p>
    <a href="CookieServlet">Get cookie</a>
</body>
</html>
