<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>色の管理・追加</title>
</head>

<body>
	<!-- Main -->
	<main id="main"
		class="grid grid-cols-12 gap-6 py-16 bg-white sm:px-4 lg:px-16">
		<div class="flex justify-center col-span-12">
			<a href="admin" class="px-6 py-1 text-white bg-gray-400 rounded-full">管理ページTOP</a>
		</div>
		<!-- Add Color -->
		<div class="col-span-12">
			<form action="addColor" method="post">
				<div
					class="flex flex-col gap-2 px-6 font-normal border-2 border-gray-300 rounded-xl">
					<p class="py-3 text-xl text-center border-b-2 border-gray-300">色の追加</p>
					<!-- Color Name -->
					<div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
						<div class="flex items-center col-span-3 text-center">
							<p class="font-bold text-right">カラー名</p>
						</div>
						<div class="col-span-9">
							<input type="text" name="color_name" id=""
								class="w-full rounded-xl">
						</div>
					</div>
					<!-- Color Name End -->
					<!-- Registration Button -->
					<div class="flex justify-center my-4">
						<button type="submit"
							class="max-w-lg px-32 py-2 text-center text-white bg-gray-400 rounded-full">登録する</button>
					</div>
					<!-- Registration Button End -->
				</div>
			</form>
		</div>
		<!-- Add Color End -->
		<!-- Color List -->
		<div class="col-span-12 overflow-x-auto">
			<h2 class="my-5 text-2xl font-bold text-center">カラー一覧</h2>
			<table class="table w-full text-center table-auto">
				<thead>
					<tr>
						<th>カラーID</th>
						<th>カラー名</th>
					</tr>
				</thead>
				<c:forEach var="color" items="${data}">
					<tbody>
						<tr class="hover">
							<td>${color.color_id}</td>
							<th>${color.color_name}</th>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
		<!-- Product List End -->
	</main>
	<!-- Main End -->
</body>

</html>