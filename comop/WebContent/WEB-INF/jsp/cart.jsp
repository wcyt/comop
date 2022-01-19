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
        <!-- Breadcrumbs End -->
        <!-- Products -->
        <div class="col-span-12 lg:col-span-8">
            <!-- Product -->
            <c:forEach var="product" items="${data}">
	            <div class="grid grid-cols-10 flex items-center py-8 border-b-2">
	            	<a href="getProductDetail?product_id=${product.product_id}" class="col-span-2">
	            		<img class="w-full h-44" src="images/${product.product_image}" alt="">
	            	</a>
	                <div class="flex flex-col col-span-2 py-10 ml-5 text-left">
	                    <p class="font-light">${product.product_name}</p>
	                </div>
	                <div class="flex items-center col-span-2 mx-5 text-xl font-bold text-red-400">
	                    <span>\</span>
	                    <span>${product.price}</span>
	                </div>
	                <div class="flex flex-row items-center col-span-2">
	                    <div class="relative flex flex-row w-24 h-10 ">
	                        <div class="flex items-center justify-center w-24 text-xs bg-white border cursor-default md:text-base">
	                            <span>1</span>
	                        </div>
	                        <button class="flex w-20 h-full font-semibold text-white bg-blue-700 border-l border-gray-400 cursor-pointer hover:bg-blue-600 focus:outline-none">
	                            <span class="m-auto">+</span>
	                        </button>
	                    </div>
	                </div>
	                <div class="flex items-center col-span-1">
	                    <a href="removeCart?user_id=${sessionScope.user.user_id}&product_id=${product.product_id}" class="">削除</a>
	                </div>
	            </div>
            </c:forEach>
            <!-- Product End -->
        </div>
        <!-- Products End -->
        <div class="col-span-12 mt-8 lg:mt-0 lg:ml-10 lg:col-span-4">
            <div class="px-6 bg-gray-100 border-2 border-blue-300 rounded-lg shadow">
                <button class="w-full py-3 my-4 text-xl font-bold text-white bg-blue-400 rounded-md">レジへ進む</button>
                <a href="" class="flex justify-center pb-4 text-blue-400">ショッピングを続ける</a>
            </div>
        </div>
    </main>
    <!-- Main End -->
    <%@include file="Footer.jsp" %>
</body>

</html>