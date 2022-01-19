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
<script src="https://cdn.tailwindcss.com"></script>
<link href="https://cdn.jsdelivr.net/npm/daisyui@1.16.2/dist/full.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.8.1/dist/alpine.js" defer></script>
<!-- alpine.js tailwind css -->
<title>お気に入りアイテム - comop</title>
</head>

<body class="flex flex-col h-screen">
	<%@include file="Header.jsp"%>
	<!-- Main -->
	<main id="main" class="grid grid-cols-12 bg-white mb-10 sm:px-4 lg:px-32">
		<!-- Breadcrumbs -->
		<nav class="col-span-12 mt-20 text-lg font-light breadcrumbs">
			<ul>
				<li><a href="top">ホーム</a></li>
				<li>お気に入りアイテム</li>
			</ul>
		</nav>
		<!-- Breadcrumbs End -->
		<!-- Dropdowns -->
		<div class="col-span-12">
			<h1 class="my-5 text-3xl font-bold">${user.name}さんのお気に入り</h1>
			<p class="text-red-500 text-lg mb-5">${addedFavorite}</p>
			<p class="text-red-500 text-lg mb-5">${removedFavorite}</p>
			<div class="flex flex-row">
				<p class="text-3xl">${favorites}</p>
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
							<div class="indicator">
								<div class="indicator-item rounded-full border border-gray-400 bg-white">
									<a href="removeFavorite?user_id=${user.user_id}&product_id=${product.product_id}">
										<i class="bi bi-x text-red-500 text-2xl px-1"></i>
									</a>
								</div>
								<a href="getProductDetail?product_id=${product.product_id}">
									<img src="images/${product.product_image}" alt="商品の画像" class="w-full">
								</a>
							</div>
							<div class="p-4 flex flex-row justify-between">
								<div>
									<p class="mb-2 font-medium place-content-center">${product.product_name}</p>
									<p class="text-xl font-bold text-red-600">\ ${product.price}</p>
								</div>
								<div data-tip="カートへ入れる" class="tooltip mt-10">
									<a href="addCart?user_id=${sessionScope.user.user_id}&product_id=${product.product_id}"> <i class="bi bi-cart text-white bg-blue-400 text-xl px-2 py-1 rounded-full"></i>
									</a>
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