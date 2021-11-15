<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品一覧</title>
</head>
<body>
	<h1>商品一覧</h1>
	<table border="1">
		<tr>
			<th>商品番号</th>
			<th>商品名</th>
			<th>価格</th>
		</tr>
		<c:forEach var="product" items="${data}">
			<tr>
				<td>${product.pid}</td>
				<td>${product.name}</td>
				<td>${product.price}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>