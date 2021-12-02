<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/2/2021
  Time: 3:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit</title>
</head>
<body>
<form method="post">
    <input type="text" placeholder="id" name="id">
    <input type="text" placeholder="name" name="name">
    <input type="text" placeholder="price" name="price">
    <input type="text" placeholder="amount" name="amount">
    <input type="submit" value="Edit">
    <input type="hidden" name="action" value="edit">
</form>
</body>
</html>
