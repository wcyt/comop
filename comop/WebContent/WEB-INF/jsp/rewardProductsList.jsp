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
    <!--  tailwind css -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@1.16.2/dist/full.css" rel="stylesheet" type="text/css" />
    <!-- tailwind css -->
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
            <!-- Search Input -->
            <div class="font-sans text-black bg-white">
			  <div class="border rounded overflow-hidden flex">
			    <input type="text" class="px-4 py-2" placeholder="Search...">
			    <button class="flex items-center justify-center px-4 border-l">
			      <svg class="h-4 w-4 text-grey-dark" fill="currentColor" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M16.32 14.9l5.39 5.4a1 1 0 0 1-1.42 1.4l-5.38-5.38a8 8 0 1 1 1.41-1.41zM10 16a6 6 0 1 0 0-12 6 6 0 0 0 0 12z"/></svg>
			    </button>
			  </div>
			</div>
            <!-- Search Input End -->
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