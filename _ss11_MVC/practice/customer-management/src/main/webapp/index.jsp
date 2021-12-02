<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/29/2021
  Time: 11:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer Management</title>
</head>
<body>
<h2>Customer Management</h2>
<table border="1">
<tr>
    <th>No</th>
    <th>Id</th>
    <th>Name</th>
    <th>Email</th>
    <th>Address</th>
</tr>
    <c:forEach var="customerObj" items="${customerService}" varStatus="loop">
        <tr>
            <td><c:out value="${loop.count}"/></td>
            <td><c:out value="${customerObj.id}"/></td>
            <td><c:out value="${customerObj.name}"/></td>
            <td><c:out value="${customerObj.email}"/></td>
            <td><c:out value="${customerObj.address}"/></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
