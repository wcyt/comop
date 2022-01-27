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
    <title>カート</title>
</head>

<body>
	<%@include file="Header.jsp" %>
    <!-- Main -->
    <main id="main" class="grid grid-cols-12 py-16 bg-white sm:px-4 lg:px-32">
        <!-- Breadcrumbs -->
        <nav class="col-span-12 text-lg font-light breadcrumbs">
            <ul>
                <li><a href="top">ホーム</a></li>
                <li>カート</li>
            </ul>
        </nav>
        <div class="col-span-12 lg:col-span-8">
            <div class="flex flex-row pb-8 mt-5 text-4xl ">
                <i class="mr-4 text-blue-300 bi bi-cart"></i>
                <h1 class="">ショッピングカート</h1>
            </div>
			<p class="pb-8 text-red-500 text-xl border-b-2">${cartInfo}</p>
        </div>
        <c:if test="${cart_list_size == 0}">
			<div class="col-span-8 text-center">
				<p class="my-16 text-gray-500 text-lg">カートに商品は入っていません。</p>
				<a href="getProductsList" class="bg-blue-400 text-white px-20 py-4 rounded-md">ショッピングを続ける</a>
			</div>
		</c:if>
		<!-- Breadcrumbs End -->
        <!-- Products -->
        <c:if test="${cart_list_size != 0}">
	        <div class="col-span-12 lg:col-span-8">
	            <!-- Product -->
	            <c:forEach var="cart" items="${data}">
		            <div class="grid grid-cols-12 items-center justify-between py-8 border-b-2">
		            	<a href="getProductDetail?product_id=${cart.product_id}" class="col-span-3">
		            		<img class="w-full h-44" src="images/${cart.product_image}" alt="${cart.product_name}">
		            	</a>
		                <div class="flex flex-col col-span-3 py-10 ml-5 text-left">
		                    <p class="font-light">${cart.product_name}</p>
		                    <div class=" text-xl font-bold text-red-400">
	                            <span>\</span>
	                            <span>${cart.price}</span>
	                        </div>
		                </div>
		                <div class="flex flex-row items-center col-span-3 ml-10">
		                	<!-- 購入個数が1個のとき -->
		                    <c:if test="${cart.buy_count == 1}">
				                <span class="bg-white border border-t-gray-300 border-b-gray-300 px-3 py-1 text-lg">${cart.buy_count}</span>
				                <a href="increaseBuyCount?user_id=${user.user_id}&product_id=${cart.product_id}" class="bg-blue-400 px-3 py-1 text-white text-xl">+</a>
		                    </c:if>
		                    <!-- 購入個数が2個以上 -->
		                    <c:if test="${cart.buy_count >= 2}">
			                    <a href="decreaseBuyCount?user_id=${user.user_id}&product_id=${cart.product_id}" class="bg-blue-400 px-2 py-1 text-white text-xl font-bold">－</a>
				                <span class="bg-white border border-t-gray-300 border-b-gray-300 px-3 py-1 text-lg">${cart.buy_count}</span>
				                <a href="increaseBuyCount?user_id=${user.user_id}&product_id=${cart.product_id}" class="bg-blue-400 px-3 py-1 text-white text-xl">+</a>
		                    </c:if>
		                </div>
		                <div class="flex items-center col-span-3 ml-10">
		                    <a href="removeCart?user_id=${user.user_id}&product_id=${cart.product_id}" class="">削除</a>
		                </div>
		            </div>
	            </c:forEach>
	            <!-- Product End -->
	        </div>
        </c:if>
        <!-- Products End -->
        <div class="col-span-12 mt-8 lg:mt-0 lg:ml-10 lg:col-span-4">
            <div class="px-6 bg-gray-100 border-2 border-blue-300 rounded-lg shadow">
                <a href="select?user_id=${user.user_id}" class="w-full py-3 my-4 text-xl font-bold text-white bg-blue-400 rounded-md">レジへ進む</a>
                <a href="getProductsList" class="flex justify-center pb-4 text-blue-400">ショッピングを続ける</a>
            </div>
        </div>
    </main>
    <!-- Main End -->
    <%@include file="Footer.jsp" %>
</body>

</html>