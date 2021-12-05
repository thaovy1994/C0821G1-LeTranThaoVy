<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Mangagement</title>
</head>
<body>
<h2>User Mangagement List</h2>
<form>
    <table border="1" cellpadding="5">
        <tr style="text-align: center">
            <td>Id</td>
            <td>Name</td>
            <td>Email</td>
            <td>Country</td>
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
</form>
</body>
</html>
