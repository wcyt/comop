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
    <!-- tailwind css -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@1.16.2/dist/full.css" rel="stylesheet" type="text/css" />
    <!-- tailwind css -->
    <title>商品名</title>
</head>

<body>
	<%@include file="Header.jsp" %>
    <!-- Main -->
    <main id="main" class="grid grid-cols-12 py-16 lg:px-32 sm:px-4">
        <!-- Breadcrumbs -->
        <nav class="col-span-12 text-lg font-light md:py-8 sm:py-4 sm:mt-24 md:mt-0 breadcrumbs">
            <ul>
                <li><a href="top">ホーム</a></li>
                <li>商品詳細</li>
            </ul>
        </nav>
        <!-- Breadcrumbs End -->
        <!-- Product -->
        <div class="flex col-span-12 sm:flex-col md:flex-row">
        	<c:forEach var="product" items="${data}">
	            <!-- Left -->
	            <div class="md:w-6/12">
	                <img class="sm:w-full md:w-[575px]" src="images/${product.product_image}" width="575" height="500">
	            </div>
	            <!-- Left End -->
	            <div class="md:w-1/12"></div>
	            <!-- Right -->
	            <div class="md:w-5/12">
	                <!-- ProductName And Price -->
	                <section class="font-bold md:mt-0 sm:mt-4">
	                    <h1 class="text-2xl">${product.product_name}</h1>
	                    <p class="mt-3 mb-8 text-3xl text-red-500">\ ${product.price}</p>
	                </section>
	                <!-- ProductName And Price End -->
	                <!-- Inventory -->
	                <section>
	                    <div class="flex flex-row justify-between py-5 border-t border-b border-gray-300">
	                        <div class="mt-3 font-extrabold text-md">
	                            <span>S</span>
	                            <span>/</span>
	                            <span>在庫あり</span>
	                        </div>
	                        <button class="px-5 py-2 font-extrabold text-white transition duration-100 bg-blue-400 rounded-lg hover:bg-blue-500"><i class="pr-3 text-xl bi bi-cart"></i>カートに入れる</button>
	                        <i class="mt-1 text-3xl text-gray-400 transition duration-100 bi bi-suit-heart-fill hover:text-red-400"></i>
	                    </div>
	                    <div class="flex flex-row justify-between py-5 border-b border-gray-300">
	                        <div class="mt-3 font-extrabold text-md">
	                            <span>M</span>
	                            <span>/</span>
	                            <span>在庫あり</span>
	                        </div>
	                        <button class="px-5 py-2 font-extrabold text-white transition duration-100 bg-blue-400 rounded-lg hover:bg-blue-500"><i class="pr-3 text-xl bi bi-cart"></i>カートに入れる</button>
	                        <i class="mt-1 text-3xl text-gray-400 transition duration-100 bi bi-suit-heart-fill hover:text-red-400"></i>
	                    </div>
	                    <div class="flex flex-row justify-between py-5 border-b border-gray-300">
	                        <div class="mt-3 font-extrabold text-gray-400 text-md">
	                            <span>L</span>
	                            <span>/</span>
	                            <span>在庫なし</span>
	                        </div>
	                        <p class="px-5 py-2 text-lg font-extrabold text-gray-400">完売しました</p>
	                        <i class="mt-1 text-3xl text-gray-400 transition duration-100 bi bi-suit-heart-fill hover:text-red-400"></i>
	                    </div>
	                </section>
	                <!-- Inventory End -->
	                <!-- Product Description -->
	                <section>
	                    <h1 class="mt-8 text-2xl font-bold">アイテム説明</h1>
	                    <p class="mt-4 text-xl font-light">${product.product_description}</p>
	                </section>
	                <!-- Product Description End -->
	            </div>
	            <!-- Right End -->
			</c:forEach>
        </div>
        <!-- Product End -->
    </main>
    <!-- Main End -->
	<%@include file="Footer.jsp" %>
</body>

</html>