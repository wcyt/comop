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
    <title>商品一覧 - comop</title>
</head>

<body>
	<%@include file="Header.jsp" %>
    <!-- Main -->
    <main id="main" class="grid grid-cols-12 gap-8 py-16 bg-white sm:px-4 lg:px-32">
        <!-- Breadcrumbs -->
        <nav class="col-span-12 text-lg font-light breadcrumbs">
            <ul>
                <li><a href="top">ホーム</a></li>
                <li>商品一覧</li>
            </ul>
        </nav>
        <!-- Breadcrumbs End -->
        <!-- Side Bar -->
        <aside class="col-span-3 bg-gray-100 rounded-lg lg:col-span-2">
            <div class="p-4 text-white bg-gray-400 rounded-t-lg">
                <p class="mb-1 text-md">対象商品</p>
                <p class="inline text-4xl font-bold">${targetProducts}</p>
                <span class="">件</span>
            </div>
            <form method="post" action="refineSearch">
            	<!-- Size -->
            	<div class="my-8">
	            	<p class="pb-2 ml-3 text-xl font-bold">サイズ</p>
	            	<ul class="list-none">
	            		<li class="my-1">
		            		<label class="inline-flex items-center">
		                    	<input type="radio" name="size" class="mx-3 text-blue-400 rounded-full focus:outline-none">
		                        <span class="ml-2 text-lg">キッズ</span>
		                    </label>
	               		</li>
	            		<li class="my-1">
		            		<label class="inline-flex items-center">
		                    	<input type="radio" name="size" class="mx-3 text-blue-400 rounded-full focus:outline-none">
		                        <span class="ml-2 text-lg">小さめ</span>
		                    </label>
	               		</li>
	               		<li class="my-1">
		            		<label class="inline-flex items-center">
		                    	<input type="radio" name="size" class="mx-3 text-blue-400 rounded-full focus:outline-none">
		                        <span class="ml-2 text-lg">ふつう</span>
		                    </label>
	               		</li>
	            	</ul>
            	</div>
            	<!-- Size End-->
	            <!-- Material -->
	            <div class="my-8">
	            	<p class="pb-2 ml-3 text-xl font-bold">素材</p>
	            	<ul class="list-none">
	            		<li class="my-1">
		            		<label class="inline-flex items-center">
		                    	<input type="checkbox" name="material" class="mx-3 text-blue-400 rounded-full focus:outline-none">
		                        <span class="ml-2 text-lg">不織布</span>
		                    </label>
	               		</li>
	            		<li class="my-1">
		            		<label class="inline-flex items-center">
		                    	<input type="checkbox" name="material" class="mx-3 text-blue-400 rounded-full focus:outline-none">
		                        <span class="ml-2 text-lg">ウレタン</span>
		                    </label>
	               		</li>
	               		<li class="my-1">
		            		<label class="inline-flex items-center">
		                    	<input type="checkbox" name="material" class="mx-3 text-blue-400 rounded-full focus:outline-none">
		                        <span class="ml-2 text-lg">布</span>
		                    </label>
	               		</li>
	               		<li class="my-1">
		            		<label class="inline-flex items-center">
		                    	<input type="checkbox" name="material" class="mx-3 text-blue-400 rounded-full focus:outline-none">
		                        <span class="ml-2 text-lg">ポリウレタン</span>
		                    </label>
	               		</li>
	            	</ul>
	            </div>
	            <!-- Material End -->
	            <!-- Price -->
	            <div class="my-8">
	            	<p class="pb-2 ml-3 text-xl font-bold">価格</p>
	            	<div class="flex flex-row mt-2 ml-2">
	                    <input type="text" name="pmin" id="" class="w-1/3 h-6 border-none"><span class="ml-2">円</span>
	                    <input type="text" name="pmax" id="" class="w-1/3 h-6 ml-3 border-none"><span class="ml-2">円</span>
	                </div>
	            </div>
	            <!-- Price End -->
	            <!-- Colors -->
	            <div class="my-8">
	                <p class="pb-2 ml-3 text-xl font-bold">カラー</p>
	                <ul class="flex flex-col">
	                    	<li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color" class="mx-3 text-blue-400 rounded-full">
	                                <span class="p-2 bg-white border rounded-full"> </span>
	                                <span class="ml-2">ホワイト</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color" class="mx-3 text-blue-400 rounded-full focus:outline-none">
	                                <span class="p-2 bg-black rounded-full"> </span>
	                                <span class="ml-2">ブラック</span>
	                            </label>
	                        </li>
	                       <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color" class="mx-3 text-blue-400 rounded-full">
	                                <span class="p-2 bg-red-400 rounded-full"> </span>
	                                <span class="ml-2">レッド</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color" class="mx-3 text-blue-400 rounded-full">
	                                <span class="p-2 bg-green-400 rounded-full"> </span>
	                                <span class="ml-2">グリーン</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color" class="mx-3 text-blue-400 rounded-full">
	                                <span class="p-2 bg-blue-400 rounded-full"> </span>
	                                <span class="ml-2">ブルー</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color" class="mx-3 text-blue-400 rounded-full">
	                                <span class="p-2 bg-yellow-300 rounded-full"> </span>
	                                <span class="ml-2">イエロー</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color" class="mx-3 text-blue-400 rounded-full">
	                                <span class="p-2 bg-orange-400 rounded-full"> </span>
	                                <span class="ml-2">オレンジ</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color" class="mx-3 text-blue-400 rounded-full">
	                                <span class="p-2 bg-yellow-800 rounded-full"> </span>
	                                <span class="ml-2">ブラウン</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color" class="mx-3 text-blue-400 rounded-full">
	                                <span class="p-2 bg-orange-100 rounded-full"> </span>
	                                <span class="ml-2">ベージュ</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color" class="mx-3 text-blue-400 rounded-full">
	                                <span class="p-2 bg-gray-400 rounded-full"> </span>
	                                <span class="ml-2">グレー</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color" class="mx-3 text-blue-400 rounded-full">
	                                <span class="p-2 bg-pink-400 rounded-full"> </span>
	                                <span class="ml-2">ピンク</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color" class="mx-3 text-blue-400 rounded-full">
	                                <span class="p-2 bg-lime-700 rounded-full"> </span>
	                                <span class="ml-2">カーキ</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color" class="mx-3 text-blue-400 rounded-full">
	                                <span class="p-2 bg-indigo-800 rounded-full"> </span>
	                                <span class="ml-2">ネイビー</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color" class="mx-3 text-blue-400 rounded-full">
	                                <span class="p-2 bg-purple-400 rounded-full"> </span>
	                                <span class="ml-2">パープル</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color" class="mx-3 text-blue-400 rounded-full">
	                                <span class="p-2 bg-teal-200 rounded-full"> </span>
	                                <span class="ml-2">パステルグリーン</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color" class="mx-3 text-blue-400 rounded-full">
	                                <span class="p-2 bg-cyan-200 rounded-full"> </span>
	                                <span class="ml-2">パステルブルー</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color" class="mx-3 text-blue-400 rounded-full">
	                                <span >その他</span>
	                            </label>
	                        </li>
	                    </ul>
	                <div class="flex justify-end mt-3">
	                	<button type="button" class="px-3 mr-3 font-semibold text-blue-400 border border-blue-400 rounded-full focus:outline-none" onclick="uncheckAll()">クリア</button>
	                    <button type="submit" class="px-3 mr-3 font-semibold text-white bg-blue-400 border rounded-full focus:outline-none">OK</button>
	                </div>
	            </div>
            	<!-- Colors End -->
            </form>
        </aside>
        <!-- Side Bar End -->
        <!-- Products -->
        <article class="col-span-9">
            <!-- Product Description -->
            <section class="ml-4">
                <h1 class="text-4xl font-bold">マスク</h1>
                <p class="my-8">マスクの一覧です。</p>
                <p class="text-2xl mb-8">${message}</p>
            </section>
            <!-- Product Description End -->
            <!-- Dropdowns -->
            <div class="flex flex-row gap-8 ml-4">
                <div class="dropdown dropdown-hover">
                    <div tabindex="0" class="pt-2 m-1 font-bold text-center text-black bg-white text-md">すべてのショップ</div>
                    <ul tabindex="0" class="w-40 py-2 bg-white rounded-2xl menu dropdown-content">
                        <li><a>Item 2</a></li>
                        <li><a>Item 3</a></li>
                    </ul>
                </div>
                <div class="dropdown dropdown-hover">
                    <div tabindex="0" class="pt-2 m-1 font-bold text-center text-black bg-white text-md">すべてのカテゴリー</div>
                    <ul tabindex="0" class="w-40 py-2 bg-white rounded-2xl menu dropdown-content">
                        <li><a>Item 2</a></li>
                        <li><a>Item 3</a></li>
                    </ul>
                </div>
                <div class="dropdown dropdown-hover">
                    <div tabindex="0" class="pt-2 m-1 font-bold text-center text-black bg-white text-md">すべての価格タイプ</div>
                    <ul tabindex="0" class="w-40 py-2 bg-white rounded-2xl menu dropdown-content">
                        <li><a>Item 2</a></li>
                        <li><a>Item 3</a></li>
                    </ul>
                </div>
            </div>
            <!-- Dropdowns End -->
            <!-- Products List -->
            <ul class="grid grid-cols-3 lg:grid-cols-5 gap-4 mt-5 sm:ml-5 lg:ml-0 lg:justify-center">
                <c:forEach var="product" items="${data}">
                	<li class="flex flex-col w-40 transition duration-400 hover:bg-gray-100">
                		<a href="getProductDetail?product_id=${product.product_id}">
                			<img class="w-full h-44" src="images/${product.product_image}" alt="${product.product_name}">
                		</a>
	                    <div class="p-4">
	                        <p class="mb-1 font-bold text-md">${product.product_name}</p>
	                        <p class="text-xl font-bold">\ ${product.price}</p>
	                    </div>
                	</li>
                </c:forEach>
            </ul>
            <!-- Products List End -->
        </article>
        <!-- Products End -->
    </main>
    <!-- Main End -->
    <%@include file="Footer.jsp" %>
</body>
<script>
    function uncheckAll() {
        const checkbox = document.getElementsByName("color");

        for (i = 0; i < checkbox.length; i++) {
            checkbox[i].checked = false;
        }
    }
</script>

</html>