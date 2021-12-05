<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/4/2021
  Time: 7:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create New User</title>
</head>
<body>
<form action="/users_list" method="post">
    <input type="hidden" name="action" value="create">
    <div>
        <input type="text" name="id" placeholder="id">
    </div>
    <div>
        <input type="text" name="name" placeholder="name">
    </div>
    <div>
        <input type="text" name="email" placeholder="email">
    </div>
    <div>
        <input type="text" name="country" placeholder="country">
    </div>
    <div>
        <input type="submit" value="create">
    </div>
</form>
</body>
</html>
