<!DOCTYPE html>
<html lang="en">

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
    <title>トップページ</title>
</head>

<body>
	<%@include file="Header.jsp"%>
    <!-- Main -->
    <main id="main" class="grid grid-cols-12 gap-8 py-16 bg-white sm:px-4 lg:px-32">
        <!-- Breadcrumbs -->
        <nav class="col-span-12 mt-3 text-lg font-light breadcrumbs">
            <ul>
                <li><a href="top">ホーム</a></li>
                <li>ポイント商品一覧</li>
            </ul>
        </nav>
        <!-- Breadcrumbs End -->
        <!-- Products -->
        <article class="col-span-12">
            <!-- Product Description -->
            <section>
                <h1 class="text-4xl font-bold">ポイント商品一覧</h1>
                <p class="my-8">ポイントで好きな商品と交換できます。</p>
            </section>
            <!-- Product Description End -->
            <!-- Products List -->
            <ul class="flex flex-row flex-wrap gap-6 mt-5">
            	<c:forEach var="reward" items="${data}">
	                <li class="flex flex-col w-64 transition duration-400 hover:bg-gray-100">
	                    <img class="h-44" src="images/${reward.reward_product_image}" alt="">
	                    <div class="p-4">
	                        <p class="mb-2 text-xl">${reward.reward_product_name}</p>
	                        <div class="my-4">
	                        	<span class="text-2xl text-red-500 font-bold ">${reward.point_price}</span>
	                        	<span class="text-md font-bold">ポイント</span>
	                        </div>
	                        <p class="text-lg">${reward.reward_product_description}</p>
	                    </div>
	                </li>
                </c:forEach>
            </ul>
            <!-- Products List End -->
        </article>
        <!-- Products End -->
    </main>
    <!-- Main End -->
    <%@include file="Footer.jsp"%>
</body>
</html>