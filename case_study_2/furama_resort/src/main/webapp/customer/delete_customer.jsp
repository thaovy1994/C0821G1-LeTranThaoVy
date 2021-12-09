<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/8/2021
  Time: 1:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body class="bg-image"
      style="
    background-image: url('https://bgwall.net/wp-content/uploads/2014/09/Dandelion-Flower-Wallpaper-Full-HD.jpg');">
<div class="row">
    <div class="col-lg-1">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmzVHX-tqV7TnaGm1NeHANiMX1dcGm4bfHrQ&usqp=CAU"
             width="100px">
    </div>
</div>
<div>
<form method="post">
    <input type="hidden" name="action" value="delete">
    <div class="row g-3 align-items-center">
        <div class="col-lg-auto ms-lg-5">
            <input type="text" name="id" placeholder="id" class="form-control" aria-describedby="passwordHelpInline">
        </div>
    </div>
    <div class="row g-3 align-items-center">
        <div class="col-lg-auto ms-lg-5">
            <%--            <input type="submit" value="Delete">--%>
            <input type="submit" value="delete" class="btn btn-primary" data-bs-toggle="modal"
                                   data-bs-target="#myModal">
<%--                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">--%>
<%--                    Delete--%>
<%--                </button>--%>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Confirmation</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Are you sure to delete customer?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary">Delete</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function(){
            $("#myBtn").click(function(){
                $("#myModal").modal();
            });
        });
    </script>
</form>
</div>
</body>
</html>
