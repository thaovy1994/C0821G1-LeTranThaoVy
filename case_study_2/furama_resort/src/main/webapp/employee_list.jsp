<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Case Study</title>
</head>
<body>
<div class="row">
    <div class="col-lg-1">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmzVHX-tqV7TnaGm1NeHANiMX1dcGm4bfHrQ&usqp=CAU"
             width="100px">
    </div>
</div>
<table border="1">
    <tr style="text-align: center">
        <td>Id</td>
        <td>Name</td>
        <td>Date of birth</td>
        <td>Id Card</td>
        <td>Salary</td>
        <td>Phone</td>
        <td>Email</td>
        <td>Address</td>
        <td>Education Degree</td>
        <td>Position</td>
        <td>Division</td>
    </tr>
    <c:forEach var="employee" items="${employee}">
        <tr>
            <td><c:out value="${employee.id}"/></td>
            <td><c:out value="${employee.name}"/></td>
            <td><c:out value="${employee.birthday}"/></td>
            <td><c:out value="${employee.idCard}"/></td>
            <td><c:out value="${employee.salary}"/></td>
            <td><c:out value="${employee.phone}"/></td>
            <td><c:out value="${employee.email}"/></td>
            <td><c:out value="${employee.address}"/></td>
            <td><c:out value="${employee.degree}"/></td>
            <td><c:out value="${employee.position}"/></td>
            <td><c:out value="${employee.division}"/></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
