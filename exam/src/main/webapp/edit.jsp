<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/13/2021
  Time: 9:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body class="bg-image"
      style="
    background-image: url('https://wallpapercave.com/wp/YS2idQD.jpg');
      height: 400px;">
<div class="row">
    <div class="col-lg-1">
        <img src="https://i.pinimg.com/736x/76/3e/3b/763e3befaa5b92e45f0d3a24379926cb.jpg"
             width="100px">
    </div>
</div>
<div>
    <span class="text-center fs-2 btn-danger ms-lg-5" style="color: yellow">
    <c:out value="${msgSameCode}"></c:out></span>
</div>
<form method="post">
    <div class="container mt-4">
        <input type="hidden" name="action" value="edit">
        <div class="row align-items-center">
            <div class="col-lg-auto">
                <input type="text" name="patient_id" placeholder="patient_id" class="form-control">
            </div>
        </div>
        <div class="row g-3 align-items-center">
            <div class="col-lg-auto">
                <input type="text" name="records_id" placeholder="records_id" class="form-control">
            </div>
        </div>
        <div class="row g-3 align-items-center">
            <div class="col-lg-auto">
                <input type="text" name="name" placeholder="name" class="form-control">
                <p style="color: red"><c:out value="${msgName}"></c:out></p>
            </div>
        </div>
        <div class="row g-3 align-items-center">
            <div class="col-lg-auto">
                <input type="text" name="day_in" placeholder="day_in" class="form-control">
            </div>
        </div>
        <div class="row g-3 align-items-center">
            <div class="col-lg-auto">
                <input type="text" name="day_out" placeholder="day_out" class="form-control">
            </div>
        </div>
        <div class="row g-3 align-items-center">
            <div class="col-lg-auto">
                <input type="text" name="reason" placeholder="reason" class="form-control">
            </div>
        </div>
        <div class="row g-3 align-items-center">
            <div class="col-lg-auto">
                <input type="submit" value="Edit">
            </div>
        </div>
    </div>
</form>
</body>
</html>
