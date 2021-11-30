<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ja">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- font -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
<!-- font  -->
<!-- alpine.js tailwind css -->
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2/dist/tailwind.min.css"
	rel="stylesheet" type="text/css" />
<script src="https://unpkg.com/tailwindcss-jit-cdn"></script>
<link href="https://cdn.jsdelivr.net/npm/daisyui@1.16.2/dist/full.css"
	rel="stylesheet" type="text/css" />
<script
	src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.8.1/dist/alpine.js"
	defer></script>
<!-- alpine.js tailwind css -->
<title>ユーザー一覧</title>
</head>

<body>
	<!-- Main -->
	<main id="main"
		class="grid grid-cols-12 gap-6 py-16 bg-white sm:px-4 lg:px-16">
		<div class="flex justify-center col-span-12">
			<a href="admin" class="px-6 py-1 text-white bg-gray-400 rounded-full">管理ページTOP</a>
		</div>
		<div class="flex flex-col items-center col-span-12 gap-3">
			<h1 class="text-2xl font-bold text-center">ユーザー登録</h1>
		</div>
		<!-- User List -->
		<div class="col-span-12 overflow-x-auto">
			<h2 class="my-5 text-2xl font-bold text-center">ユーザー一覧</h2>
			<table class="table w-full text-center table-auto">
				<thead>
					<tr>
						<th>ユーザーID</th>
						<th>名前</th>
						<th>メールアドレス</th>
						<th>住所</th>
						<th>苗字</th>
						<th>苗字（かな）</th>
						<th>名前</th>
						<th>名前（かな）</th>
						<th>電話番号</th>
						<th>郵便番号</th>
						<th>パスワード</th>
						<th>ポイント</th>
						<th>ユーザー退会フラグ</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="UserBean" items="${data}">
						<tr class="hover">
							<th>${UserBean.user_id}</th>
							<td>${UserBean.name}</td>
							<td>${UserBean.mail}</td>
							<td>${UserBean.address}</td>
							<td>${UserBean.first_name}</td>
							<td>${UserBean.first_name_kana}</td>
							<td>${UserBean.last_name}</td>
							<td>${UserBean.last_name_kana}</td>
							<td>${UserBean.tel}</td>
							<td>${UserBean.postal_code}</td>
							<td>${UserBean.password}</td>
							<td>${UserBean.point}</td>
							<td>${UserBean.user_lapse}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- User List End -->
	</main>
	<!-- Main End -->
</body>
</html>
