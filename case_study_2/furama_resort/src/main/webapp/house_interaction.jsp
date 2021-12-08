<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/8/2021
  Time: 3:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Service</title>
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
                        <a class="nav-link" href="/index_house?action=create">Create</a>
                    </li>
                </ul>
                <form class="d-flex" method="post">
                    <input type="hidden" name="action" value="search">
                    <input class="form-control me-2" type="search" aria-label="Search" name="name"
                           placeholder="name need to find">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</div>
<form>
    <c:out value="${msg}"></c:out>
    <div class="row">
        <div class="col-lg-12">
            <table class="table">
                <thead>
                <tr style="text-align: center">
                    <th scope="col">Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Area</th>
                    <th scope="col">Price</th>
                    <th scope="col">Maximum person</th>
                    <th scope="col">Type of rent</th>
                    <th scope="col">Standard of room</th>
                    <th scope="col">Description</th>
                    <th scope="col">Number of floors</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="houses" items="${house}">
                    <tr>
                        <th scope="col"><c:out value="${houses.service_id}"/></th>
                        <td><c:out value="${houses.service_name}"/></td>
                        <td><c:out value="${houses.service_area}"/></td>
                        <td><c:out value="${houses.service_cost}"/></td>
                        <td><c:out value="${houses.service_max_people}"/></td>
                        <td>
                            <c:if test="${houses.rent_type_id == 1}">
                                Villa
                            </c:if>
                            <c:if test="${houses.rent_type_id == 2}">
                                House
                            </c:if>
                            <c:if test="${houses.rent_type_id == 3}">
                                Room
                            </c:if>
                        </td>
                        <td><c:out value="${houses.standard_room}"/></td>
                        <td><c:out value="${houses.description_other_convenience}"/></td>
                        <td><c:out value="${houses.number_of_floors}"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</form>
</body>
</html>
