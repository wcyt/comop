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
			<div class="flex flex-row pb-5">
				<p class="text-4xl">${favorites} </p>
				<p class="px-1 pr-5 mt-3 text-lg">件</p>
			</div>
		</div>
		<!-- Dropdowns End -->
		<!-- Products -->
		<div class="col-span-12 mt-6">
			<c:if test="${favorites == 0}">
				<div class="flex flex-col mt-10 text-center text-gray-400">
					<i class="bi bi-suit-heart  text-8xl font-light"></i>
					<p class="mt-8 text-2xl">お気に入りアイテムの登録はありません</p>
					<p class="mt-6 text-lg">気になるアイテムを見つけよう！</p>
				</div>
			</c:if>
			<c:if test="${favorites != 0}">
				<ul class="flex flex-row flex-wrap gap-7">
					<c:forEach var="product" items="${data}">
						<li class="flex flex-col transition border border-gray-200 w-52 duration-400 hover:bg-gray-100">
							<div class="indicator">
								<div class="indicator-item rounded-full bg-red-500">
									<a href="removeFavorite?user_id=${user.user_id}&product_id=${product.product_id}">
										<i class="bi bi-x text-white text-xl px-1"></i>
									</a>
								</div>
								<a href="getProductDetail?product_id=${product.product_id}">
									<img src="images/${product.product_image}" alt="${product.product_name}" class="w-[206px] h-[206px]">
								</a>
							</div>
							<div class="p-4 flex flex-row justify-between">
								<div>
									<p class="mb-2 font-medium place-content-center">${product.product_name}</p>
									<p class="text-xl font-bold text-red-600">\ ${product.price}</p>
								</div>
								<div data-tip="カートへ入れる" class="tooltip mt-10">
									<a href="addCart?user_id=${sessionScope.user.user_id}&product_id=${product.product_id}">
										<i class="bi bi-cart text-white bg-blue-400 text-xl px-2 py-1 rounded-full"></i>
									</a>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</c:if>
		</div>
		<!-- Products End -->
	</main>
	<!-- Main End -->
	<%@include file="Footer.jsp"%>
</body>

</html>