<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Employee</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body class="bg-image"
      style="
    background-image: url('https://bgwall.net/wp-content/uploads/2014/09/Dandelion-Flower-Wallpaper-Full-HD.jpg');
      height: 400px;">
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
                        <a class="nav-link" href="/index_employee?action=create">Create</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/index_employee?action=delete">Delete</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/index_employee?action=edit">Edit</a>
                    </li>
                </ul>
                <form class="d-flex" method="post">
                    <input type="hidden" name="action" value="search">
                    <input class="form-control me-2" type="search" aria-label="Search" name="name" placeholder="name need to find">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</div>
<form class="bg-info">
    <c:out value="${msg}"></c:out>
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
                <tbody class="content" style="color: white">
                <c:forEach var="employee" items="${employee}">
                    <tr>
                        <th scope="col"><c:out value="${employee.employee_id}"/></th>
                        <td><c:out value="${employee.employee_name}"/></td>
                        <td><c:out value="${employee.employee_birthday}"/></td>
                        <td><c:out value="${employee.employee_id_card}"/></td>
                        <td><c:out value="${employee.employee_salary}"/></td>
                        <td><c:out value="${employee.employee_phone}"/></td>
                        <td><c:out value="${employee.employee_email}"/></td>
                        <td><c:out value="${employee.employee_address}"/></td>
                        <td><c:out value="${employee.education_degree_id}"/></td>
                        <td><c:out value="${employee.position_id}"/></td>
                        <td><c:out value="${employee.division_id}"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</form>
</body>
</html>
