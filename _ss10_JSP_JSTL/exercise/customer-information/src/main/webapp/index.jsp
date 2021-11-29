<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/29/2021
  Time: 11:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>Hiển thị danh sách khách hàng</title>
  </head>
  <body>
  <h2 style="margin-left: 50px">Danh sách khách hàng</h2>
  <table border="1">
    <tr>
      <th>Tên</th>
      <th>Ngày sinh</th>
      <th>Địa chỉ</th>
      <th>Ảnh</th>
    </tr>
    <c:forEach var="customerObj" items="${customerListServlet}">
      <tr>
        <td><c:out value="${customerObj.name}"/></td>
        <td><c:out value="${customerObj.dateOfBirth}"/></td>
        <td><c:out value="${customerObj.address}"/></td>
        <td><img src="<c:url value="${customerObj.image}"/>" width="80" height="80"/></td>
      </tr>
    </c:forEach>
  </table>
  </body>
</html>
