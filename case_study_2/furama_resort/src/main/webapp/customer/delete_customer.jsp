<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">

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
<div class="row g-3 align-items-center">
        <%--            data-bs-target="#myModal" dùng để xác định popup nào được gọi--%>
        <%--            data-toggle="modal" là lệnh mở một Modal Popup trong Bootstrap--%>
        <%--                có thể use button or thẻ <a> or <span> để gọi popup nhưng phải luôn có 2 thuộc tính ở trên.--%>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
            Delete
        </button>
</div>
<!-- Modal -->
<form method="post">
    <div class="modal fade" id="myModal" role="dialog" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <%--Class fade là hiệu ứng transition với fade in và fade out.--%>
        <%--Thuộc tính role="dialog" hiển thị popup dạng dialog--%>
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Confirmation</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="text" name="id" placeholder="id" class="form-control">
                    <p>Are you sure to delete customer?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <%--                có thể sử dụng <button>, <a> hoặc <span> nhưng phải có data-bs-dismiss="modal" để close--%>
                    <%--                có thể thêm class="close"--%>
                    <input type="hidden" name="action" value="delete">
                    <button type="submit" name="delete" class="btn btn-primary">Delete</button>
                </div>
            </div>
        </div>
    </div>
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script>
    // $(document).ready(function () {
    //     $("#myBtn").click(function () {
    //         $("#myModal").modal();
    //     });
    // });
    var myModal = new bootstrap.Modal(document.getElementById('myModal'), {})
    myModal.target()
</script>
</body>
</html>
