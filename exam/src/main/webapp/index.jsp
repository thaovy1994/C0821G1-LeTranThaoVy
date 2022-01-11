<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body class="bg-image"
      style="
    background-image: url('https://wallpapercave.com/wp/YS2idQD.jpg');
      height: 400px;">
<div class="row">
    <div class="col-lg-1">
        <img src="https://i.pinimg.com/736x/76/3e/3b/763e3befaa5b92e45f0d3a24379926cb.jpg"
             width="150px">
    </div>
    <nav class="navbar navbar-expand-lg navbar-light bg-info">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="/index?action=edit">Edit</a>
                    </li>
                    <li class="nav-item">
                        <button type="button" class="nav-item btn btn-info" data-bs-toggle="modal"
                                data-bs-target="#myModal">
                            Delete
                        </button>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<form class="bg-light">
    <p class="text-center fs-2 btn-danger ms-lg-5" style="color: orange">
        <c:out value="${msg}"></c:out>
    </p>
    <p class="mx-5" style="color: yellow">
    <div class="row">
        <div class="col-lg-12">
            <table class="table">
                <thead>
                <tr style="text-align: center">
                    <th scope="col">No</th>
                    <th scope="col">patient_id</th>
                    <th scope="col">records_id</th>
                    <th scope="col">name</th>
                    <th scope="col">day_in</th>
                    <th scope="col">day_out</th>
                    <th scope="col">reason</th>
                </tr>
                </thead>
                <tbody class="content" style="color: dimgrey; text-align: center">
                <c:forEach var="patients" items="${patient}" varStatus="loop">
                    <tr>
                        <td><c:out value="${loop.count}"/></td>
                        <td><c:out value="${patients.patient_id}"/></td>
                        <td><c:out value="${patients.records_id}"/></td>
                        <td><c:out value="${patients.name}"/></td>
                        <td><c:out value="${patients.day_in}"/></td>
                        <td><c:out value="${patients.day_out}"/></td>
                        <td><c:out value="${patients.reason}"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</form>
<form method="post">
    <div class="modal fade" id="myModal" role="dialog" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Confirmation</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="text" name="id" placeholder="patient_id U want to delete" class="form-control">
                    <p>Are you sure to delete?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" name="delete" class="btn btn-primary">Delete</button>
                    <input type="hidden" name="action" value="delete">
                </div>
            </div>
        </div>
    </div>
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</body>
</html>
