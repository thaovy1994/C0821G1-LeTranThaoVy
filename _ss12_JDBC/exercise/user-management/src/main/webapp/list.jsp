<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/1/2021
  Time: 9:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<div align="center">
    <c:out value="${msg}"></c:out>
</div>
<h2 align="center">List of Users</h2>
<br>
<div align="center">
    <a href="/users_list?action=create">
        <button>Create New User</button>
    </a>
</div>
<form align="center" method="post" action="/users_list">
        <input type="hidden" name="action" value="arrange">
        <button>Arrange</button>
    </a>
</form>
<form align="center" method="post" action="/users_list">
    <input type="hidden" name="action" value="find">
    <input type="text" name="country" placeholder="country name">
    <button>Search</button>
</form>
<div align="center">
    <table border="1" cellpadding="5">
        <tr style="text-align: center">
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
        </tr>
        <c:forEach var="user" items="${users}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
