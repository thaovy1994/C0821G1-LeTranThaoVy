<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create Employee</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<div class="row">
    <div class="col-lg-1">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmzVHX-tqV7TnaGm1NeHANiMX1dcGm4bfHrQ&usqp=CAU"
             width="100px">
    </div>
</div>
<form method="post">
    <input type="hidden" name="action" value="create">
    <div class="row g-3 align-items-center">
        <div class="col-lg-auto ms-lg-5">
            <input type="text" name="id" placeholder="id" class="form-control" aria-describedby="passwordHelpInline">
        </div>
    </div>
    <div class="row g-3 align-items-center">
        <div class="col-lg-auto ms-lg-5">
            <input type="text" name="name" placeholder="name" class="form-control">
        </div>
    </div>
    <div class="row g-3 align-items-center">
        <div class="col-lg-auto ms-lg-5">
            <input type="text" name="birthday" placeholder="birthday" class="form-control">
        </div>
    </div>
    <div class="row g-3 align-items-center">
        <div class="col-lg-auto ms-lg-5">
            <input type="text" name="idCard" placeholder="idCard" class="form-control">
        </div>
    </div>
    <div class="row g-3 align-items-center">
        <div class="col-lg-auto ms-lg-5">
            <input type="text" name="salary" placeholder="salary" class="form-control">
        </div>
    </div>
    <div class="row g-3 align-items-center">
        <div class="col-lg-auto ms-lg-5">
            <input type="text" name="phone" placeholder="phone" class="form-control">
        </div>
    </div>
    <div class="row g-3 align-items-center">
        <div class="col-lg-auto ms-lg-5">
            <input type="text" name="email" placeholder="email" class="form-control">
        </div>
    </div>
    <div class="row g-3 align-items-center">
        <div class="col-lg-auto ms-lg-5">
            <input type="text" name="address" placeholder="address" class="form-control">
        </div>
    </div>
    <div class="row g-3 align-items-center">
        <div class="col-lg-auto ms-lg-5">
            <input type="text" name="degree" placeholder="degree" class="form-control">
        </div>
    </div>
    <div class="row g-3 align-items-center">
        <div class="col-lg-auto ms-lg-5">
            <input type="text" name="position" placeholder="position" class="form-control">
        </div>
    </div>
    <div class="row g-3 align-items-center">
        <div class="col-lg-auto ms-lg-5">
            <input type="text" name="division" placeholder="division" class="form-control">
        </div>
    </div>
    <div class="row g-3 align-items-center">
        <div class="col-lg-auto ms-lg-5">
        <input type="submit" value="Add New">
        </div>
    </div>
</form>
</body>
</html>
