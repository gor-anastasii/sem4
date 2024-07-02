
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        form{
            display: flex;
            flex-direction: column;
            width:300px;
        }

    </style>
</head>
<body>
<form action="RegisterServlet" method="post">
    <input name="login" type="text" placeholder="login" value="${login}"/>
    <input name="password" type="password" placeholder="password"/>
    <select name="status">
        <option value="user">user</option>
        <option value="admin">admin</option>
    </select>
    <button type="submit">Registration</button>
</form>
</body>
</html>
