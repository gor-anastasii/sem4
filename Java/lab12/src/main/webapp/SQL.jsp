
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<br>
    <h3>DataBase</h3>
    <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/java?useUnicode=true&characterEncoding=utf-8"
                       user="root"  password="Mtu57-jiop"/>

    <sql:query dataSource = "${db}" sql = "select * from universities;" var = "rs" />
    <c:forEach var="unic" items="${rs.rows}">
        ${unic.id} ${unic.name} ${unic.rating} ${unic.address}<br>
    </c:forEach>
    </br>
    <sql:query dataSource="${db}" var="user" >
        SELECT * FROM Status where name = ?
        <sql:param value="admin" />
    </sql:query>
    <c:forEach var="user" items="${user.rows}">
        ${user.ID} ${user.name} ${user.password} ${user.status}<br>
    </c:forEach>
    </br>
    <sql:transaction dataSource = "${db}">
        <sql:update var = "new">
            insert status(name, password, status) values("newAdmin", "newAdmin", "admin")
        </sql:update>
        <sql:update var = "new2">
            insert status(name, password, status) values("newAdmin2", "newAdmin2", "admin")
        </sql:update>
    </sql:transaction>
    </br>
    <sql:query dataSource = "${db}" sql = "select * from status;" var = "rs" />
    <c:forEach var="user" items="${rs.rows}">
        ${user.ID} ${user.name} ${user.password} ${user.status}<br>
    </c:forEach>
</body>
</html>
