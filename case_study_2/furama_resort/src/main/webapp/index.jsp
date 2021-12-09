<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Employee List</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body class="bg-image"
      style="
    background-image: url('https://bgwall.net/wp-content/uploads/2014/09/Dandelion-Flower-Wallpaper-Full-HD.jpg');
      height: 400px;">
<div class="row">
    <div class="col-lg-10">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmzVHX-tqV7TnaGm1NeHANiMX1dcGm4bfHrQ&usqp=CAU"
             width="100px">
    </div>
    <div class="col-lg-2">
        thao vy
    </div>
    <nav class="navbar navbar-expand-lg navbar-light bg-info">
        <div class="container-fluid">
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="/index_employee">Employee</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/index_customer">Customer</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/index_service">Service</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/index_contract">Contract</a>
                    </li>
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" href="#">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</div>
</body>
</html>
