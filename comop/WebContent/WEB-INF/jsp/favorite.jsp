<!DOCTYPE html>
<html lang="ja">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- font -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
<!-- font  -->
<!-- alpine.js tailwind css -->
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2/dist/tailwind.min.css" rel="stylesheet" type="text/css" />
<script src="https://unpkg.com/tailwindcss-jit-cdn"></script>
<link href="https://cdn.jsdelivr.net/npm/daisyui@1.16.2/dist/full.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.8.1/dist/alpine.js" defer></script>
<!-- alpine.js tailwind css -->
<title>お気に入りアイテム - comop</title>
</head>

<body>
	<%@include file="Header.jsp"%>
	<!-- Main -->
	<main id="main" class="grid grid-cols-12 bg-white mb-10 sm:px-4 lg:px-32">
		<!-- Breadcrumbs -->
		<nav class="col-span-12 text-lg font-light breadcrumbs">
			<ul>
				<li><a href="top">Home</a></li>
				<li><a>お気に入りアイテム</a></li>
			</ul>
		</nav>
		<!-- Breadcrumbs End -->
		<!-- Dropdowns -->
		<div class="col-span-12">
			<h1 class="my-5 text-3xl font-bold">${user.name}さんのお気に入り</h1>
			<div class="flex flex-row">
				<p class="text-3xl">3</p>
				<p class="px-1 pr-5 mt-3 border-r-2">件</p>
				<div class="dropdown dropdown-hover">
					<div tabindex="0" class="pt-2 m-1 mx-5 font-bold text-center text-black bg-white text-md">すべてのショップ</div>
					<ul tabindex="0" class="w-40 py-2 bg-white rounded-2xl menu dropdown-content">
						<li><a class="bg-gray-200">すべてのショップ</a></li>
						<li><a>Item 2</a></li>
						<li><a>Item 3</a></li>
					</ul>
				</div>
				<div class="dropdown dropdown-hover">
					<div tabindex="0" class="pt-2 m-1 mx-5 font-bold text-center text-black bg-white text-md">すべてのカテゴリー</div>
					<ul tabindex="0" class="w-40 py-2 bg-white rounded-2xl menu dropdown-content">
						<li><a class="bg-gray-200">すべてのカテゴリー</a></li>
						<li><a>Item 2</a></li>
						<li><a>Item 3</a></li>
					</ul>
				</div>
				<div class="dropdown dropdown-hover">
					<div tabindex="0" class="pt-2 m-1 mx-5 font-bold text-center text-black bg-white text-md">すべての価格タイプ</div>
					<ul tabindex="0" class="w-40 py-2 bg-white rounded-2xl menu dropdown-content">
						<li><a class="bg-gray-200">すべての価格タイプ</a></li>
						<li><a>Item 2</a></li>
						<li><a>Item 3</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- Dropdowns End -->
		<!-- Products -->
		<div class="col-span-12 mt-6">
			<ul class="flex flex-row flex-wrap gap-7">
				<c:forEach var="product" items="${data}">
					<li class="flex flex-col transition w-52 duration-400 hover:bg-gray-100">
						<img src="images/${product.product_image}" alt="商品の画像" class="w-full">
						<div class="p-4 flex flex-row justify-between">
							<div>
								<p class="mb-2 font-medium">${product.product_name}</p>
								<p class="text-xl font-bold text-red-600">\ ${product.price}</p>
							</div>
							<div class="bottom-0 right-0 mt-10">
								<a href="addCart?user_id=${sessionScope.user.user_id}&product_id=${product.product_id}"><i class="bi bi-cart text-white bg-blue-300 text-xl px-3 py-2 rounded-full"></i></a>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<!-- Products End -->
	</main>
	<!-- Main End -->
	<%@include file="Footer.jsp"%>
</body>

</html>