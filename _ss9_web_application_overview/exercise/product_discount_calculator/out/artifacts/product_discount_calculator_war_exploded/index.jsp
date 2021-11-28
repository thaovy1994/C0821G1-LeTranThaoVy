<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/28/2021
  Time: 2:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<form name="/discountServlet" method="post">
    <div>
        Product Description
    </div>
    <div>
        <input type="text" name="description">
    </div>
    <div>
        List Price
    </div>
    <div>
        <input type="text" name="price">
    </div>
    <div>
        Discount Percent (%):
    </div>
    <div>
        <input type="text" name="discount">
    </div>
    <div>
        <input type="submit" value="Calculate Discount">
    </div>
</form>
</body>
</html>
