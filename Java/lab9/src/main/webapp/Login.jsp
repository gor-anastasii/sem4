<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <style>
        body, form{
            display: flex;
            flex-direction: column;
            width:300px;
        }
        a{
            margin-top:20px;
        }
    </style>
</head>
<body>
  <form action="LoginServlet" method="get">
      <input name="login" type="text" placeholder="login"/>
      <input name="password" type="password" placeholder="password"/>
      <button type="submit" >Login</button>
  </form>
  <a href="Register.jsp">Have no account? Create one</a>
</body>
</html>
