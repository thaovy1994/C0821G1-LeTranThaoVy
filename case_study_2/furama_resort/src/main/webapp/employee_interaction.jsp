<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/6/2021
  Time: 4:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee</title>
</head>
<body>
<div class="row">
    <div class="col-lg-1">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmzVHX-tqV7TnaGm1NeHANiMX1dcGm4bfHrQ&usqp=CAU"
             width="100px">
    </div>
</div>
<div class="row">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/employee_interaction?action=create">Create</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Employee</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Customer</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Service</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contract</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<div class="row">
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
</div>
</body>
</html>
