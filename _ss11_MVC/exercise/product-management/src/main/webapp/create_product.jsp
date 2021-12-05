<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/30/2021
  Time: 4:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Product</title>
</head>
<body>
<h2>Create Product</h2>
<form action="/product_List" method="post">         <%--ko thêm action thì nó sẽ auto gởi action cũ ở bên doGet--%>
    <input type="hidden" name="action" value="create">
    <div>New Product</div>
    <div>
        <input type="text" name="id" placeholder="product id">
    </div>
    <div>
        <input type="text" name="name" placeholder="product name">
    </div>
    <div>
        <input type="text" name="price" placeholder="product price">
    </div>
    <div>
        <input type="text" name="amount" placeholder="product amount">
    </div>
    <div>
        <input type="submit" value="create">
    </div>
</form>
</body>
</html>
