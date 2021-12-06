<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Employee</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="row">
    <div class="col-lg-1">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmzVHX-tqV7TnaGm1NeHANiMX1dcGm4bfHrQ&usqp=CAU"
             width="100px">
    </div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/index?action=create">Create</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Delete</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Edit</a>
                    </li>
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</div>
<form>
    <div class="row">
        <div class="col-lg-12">
            <table class="table">
                <thead>
                <tr style="text-align: center">
                    <th scope="col">Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Date of birth</th>
                    <th scope="col">Id Card</th>
                    <th scope="col">Salary</th>
                    <th scope="col">Phone</th>
                    <th scope="col">Email</th>
                    <th scope="col">Address</th>
                    <th scope="col">Education Degree</th>
                    <th scope="col">Position</th>
                    <th scope="col">Division</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="employee" items="${employee}">
                    <tr>
                        <th scope="col"><c:out value="${employee.id}"/></th>
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
                </tbody>
            </table>
        </div>
    </div>
</form>
</body>
</html>
