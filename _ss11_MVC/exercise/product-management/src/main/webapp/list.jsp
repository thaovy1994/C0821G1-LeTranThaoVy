<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Product</title>
</head>
<body>
<h2>List Product</h2>
<c:out value="${msg}"></c:out>              <%--hiện msg nếu list rỗng--%>
<br>
<a href="/product_List?action=create">
    <button>Create New Product</button>
</a>
<a href="/product_List?action=edit">
    <button>Edit Product</button>
</a>
<a href="/product_List?action=delete">
    <button>Delete Product</button>
</a>
<%--Chức năng tìm kiếm--%>
<%--<form method="get" action="/product_List">
<%--    <input type="hidden" name="action" value="search">
<%--    <input type="text" name="productName">--%>
<%--    <button>Search Product</button>--%>
<%--</form>--%>
<table border="1">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Price</th>
        <th>Amount</th>
    </tr>
    <c:forEach var="productObj" items="${products}" >
        <tr>
            <td><c:out value="${productObj.productId}"/></td>
            <td><c:out value="${productObj.productName}"/></td>
            <td><c:out value="${productObj.productPrice}"/></td>
            <td><c:out value="${productObj.productAmount}"/></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
