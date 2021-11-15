<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品登録</title>
</head>
<body>
	<h1>商品登録</h1>
	<form method="POST" action="add">
		商品番号<input type="text" name="pid"><br>
		商品名<input type="text" name="name"><br>
		価格<input type="text" name="price">
		<input type="submit" value="登録">
	</form>
</body>
</html>
