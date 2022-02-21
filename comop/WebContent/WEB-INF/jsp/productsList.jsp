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
<script>
	//カラーのチェックボックスをすべて外す
    function uncheckColorAll() {
        const checkbox = document.getElementsByName("color_id");
        for (i = 0; i < checkbox.length; i++) {
            checkbox[i].checked = false;
        }
    }

    function uncheckPackingTypeAll() {
        const checkbox = document.getElementsByName("packing_type");
        for (i = 0; i < checkbox.length; i++) {
            checkbox[i].checked = false;
        }
    }

    function uncheckMaterialAll() {
        const checkbox = document.getElementsByName("material");
        for (i = 0; i < checkbox.length; i++) {
            checkbox[i].checked = false;
        }
    }

    function uncheckSizeAll() {
        const checkbox = document.getElementsByName("size");
        for (i = 0; i < checkbox.length; i++) {
            checkbox[i].checked = false;
        }
    }
    function uncheckSortAll() {
    	const checkbox = document.getElementsByName("sort");
        for (i = 0; i < checkbox.length; i++) {
            checkbox[i].checked = false;
        }
    }

    window.addEventListener('load', function() {
    	const DURATION = 1800;
    	const element = {
    	  count: document.getElementById('count')
    	};
    	let isAnimating = false;

    	if (isAnimating) {
    		return;
    	}

		isAnimating = true;

    	const from = parseInt(element.count.dataset.from, 10);
    	const to = parseInt(element.count.dataset.to, 10);
    	const startTime = Date.now();

    	const timer = setInterval(() => {
	    	const elapsedTime = Date.now() - startTime;
	    	const progress = elapsedTime / DURATION;

	    	if (progress < 1) {
	    		element.count.textContent = Math.floor(from + progress * (to - from));
	    	} else {
	    		element.count.textContent = to;
	    		isAnimating = false;
	    		clearInterval(timer);
	    	}
    	}, 16);
    });

    function getRangeValue() {
        const range = document.getElementById('range');
        const pmax = document.getElementById('pmax');
        pmax.value = range.value;
    }
</script>

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
                <p class="inline text-4xl font-bold" id="count" data-from="0" data-to="${targetProducts}">${targetProducts}</p>
                <span class="">件</span>
            </div>
            <form method="get" action="refineSearch">
            	<!-- Size -->
            	<div class="my-8">
	            	<p class="pb-2 ml-3 text-xl font-bold">サイズ</p>
	            	<ul class="list-none">
	            		<li class="my-1">
		            		<label class="inline-flex items-center">
		                    	<input type="checkbox" name="size" class="mx-3 text-blue-400 rounded-full focus:outline-none" value="キッズ">
		                        <span class="ml-2 text-lg">キッズ</span>
		                    </label>
	               		</li>
	            		<li class="my-1">
		            		<label class="inline-flex items-center">
		                    	<input type="checkbox" name="size" class="mx-3 text-blue-400 rounded-full focus:outline-none" value="小さめ">
		                        <span class="ml-2 text-lg">小さめ</span>
		                    </label>
	               		</li>
	               		<li class="my-1">
		            		<label class="inline-flex items-center">
		                    	<input type="checkbox" name="size" class="mx-3 text-blue-400 rounded-full focus:outline-none" value="ふつう">
		                        <span class="ml-2 text-lg">ふつう</span>
		                    </label>
	               		</li>
	            	</ul>
	            	<div class="mt-3 ml-3">
	                	<button type="button" class="px-3 mr-3 font-semibold text-blue-400 border border-blue-400 rounded-full focus:outline-none" onclick="uncheckSizeAll()">クリア</button>
	                </div>
            	</div>
            	<!-- Size End-->
	            <!-- Material -->
	            <div class="my-8">
	            	<p class="pb-2 ml-3 text-xl font-bold">素材</p>
	            	<ul class="list-none">
	            		<li class="my-1">
		            		<label class="inline-flex items-center">
		                    	<input type="checkbox" name="material" class="mx-3 text-blue-400 rounded-full focus:outline-none" value="布">
		                        <span class="ml-2 text-lg">布</span>
		                    </label>
	               		</li>
	            		<li class="my-1">
		            		<label class="inline-flex items-center">
		                    	<input type="checkbox" name="material" class="mx-3 text-blue-400 rounded-full focus:outline-none" value="不織布">
		                        <span class="ml-2 text-lg">不織布</span>
		                    </label>
	               		</li>
	            		<li class="my-1">
		            		<label class="inline-flex items-center">
		                    	<input type="checkbox" name="material" class="mx-3 text-blue-400 rounded-full focus:outline-none" value="ウレタン">
		                        <span class="ml-2 text-lg">ウレタン</span>
		                    </label>
	               		</li>
	               		<li class="my-1">
		            		<label class="inline-flex items-center">
		                    	<input type="checkbox" name="material" class="mx-3 text-blue-400 rounded-full focus:outline-none" value="ポリウレタン">
		                        <span class="ml-2 text-lg">ポリウレタン</span>
		                    </label>
	               		</li>
	            	</ul>
	            	<div class="mt-3 ml-3">
	                	<button type="button" class="px-3 mr-3 font-semibold text-blue-400 border border-blue-400 rounded-full focus:outline-none" onclick="uncheckMaterialAll()">クリア</button>
	                </div>
	            </div>
	            <!-- Material End -->
	            <!-- Price -->
	            <div class="my-8">
	            	<p class="pb-2 ml-3 text-xl font-bold">価格</p>
	            	<div class="flex flex-row mt-2 ml-2">
	                    <input type="text" id="pmin" name="pmin" value="0" class="w-1/3 h-6 border-none text-right pointer-events-none focus:outline-none" readonly><span class="ml-2">円</span>
	                    <input type="text" id="pmax" name="pmax" value="5000" class="w-1/3 h-6 ml-3 border-none focus:outline-blue-400" required><span class="ml-2">円</span>
	                </div>
	                <input id="range" type="range" max="10000" step="100" class="range range-primary px-2 mt-4" oninput="getRangeValue()">
	            </div>
	            <!-- Price End -->
	            <!-- Packing Type -->
            	<div class="my-8">
	            	<p class="pb-2 ml-3 text-xl font-bold">包装タイプ</p>
	            	<ul class="list-none">
	            		<li class="my-1">
		            		<label class="inline-flex items-center">
		                    	<input type="checkbox" name="packing_type" class="mx-3 text-blue-400 rounded-full focus:outline-none" value="個別包装">
		                        <span class="ml-2 text-lg">個別包装</span>
		                    </label>
	               		</li>
	            		<li class="my-1">
		            		<label class="inline-flex items-center">
		                    	<input type="checkbox" name="packing_type" class="mx-3 text-blue-400 rounded-full focus:outline-none" value="大容量">
		                        <span class="ml-2 text-lg">大容量</span>
		                    </label>
	               		</li>
	            	</ul>
	            	<div class="mt-3 ml-3">
	                	<button type="button" class="px-3 mr-3 font-semibold text-blue-400 border border-blue-400 rounded-full focus:outline-none" onclick="uncheckPackingTypeAll()">クリア</button>
	                </div>
            	</div>
            	<!-- Packing Type End-->
            	<!-- sort -->
            	<div class="my-8">
	            	<p class="pb-2 ml-3 text-xl font-bold">並べ替え</p>
	            	<ul class="list-none">
	            		<li class="my-1">
		            		<label class="inline-flex items-center">
		                    	<input type="radio" name="sort" class="mx-3 text-blue-400 rounded-full focus:outline-none" value="asc">
		                        <span class="ml-2 text-lg">価格が低い順</span>
		                    </label>
	               		</li>
	            		<li class="my-1">
		            		<label class="inline-flex items-center">
		                    	<input type="radio" name="sort" class="mx-3 text-blue-400 rounded-full focus:outline-none" value="desc">
		                        <span class="ml-2 text-lg">価格が高い順</span>
		                    </label>
	               		</li>
	               		<li class="my-1">
		            		<label class="inline-flex items-center">
		                    	<input type="radio" name="sort" class="mx-3 text-blue-400 rounded-full focus:outline-none" value="favorite">
		                        <span class="ml-2 text-lg">お気に入り数が多い順</span>
		                    </label>
	               		</li>
	            	</ul>
	            	<div class="mt-3 ml-3">
	                	<button type="button" class="px-3 mr-3 font-semibold text-blue-400 border border-blue-400 rounded-full focus:outline-none" onclick="uncheckSortAll()">クリア</button>
	                </div>
            	</div>
            	<!-- sort End-->
	            <!-- Colors -->
	            <div class="my-8">
	                <p class="pb-2 ml-3 text-xl font-bold">カラー</p>
	                <ul class="flex flex-col">
	                    	<li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color_id" class="mx-3 text-blue-400 rounded-full" value="1">
	                                <span class="p-2 bg-white border rounded-full"> </span>
	                                <span class="ml-2">ホワイト</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color_id" class="mx-3 text-blue-400 rounded-full" value="2">
	                                <span class="p-2 bg-black rounded-full"> </span>
	                                <span class="ml-2">ブラック</span>
	                            </label>
	                        </li>
	                       <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color_id" class="mx-3 text-blue-400 rounded-full" value="3">
	                                <span class="p-2 bg-red-400 rounded-full"> </span>
	                                <span class="ml-2">レッド</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color_id" class="mx-3 text-blue-400 rounded-full" value="4">
	                                <span class="p-2 bg-green-400 rounded-full"> </span>
	                                <span class="ml-2">グリーン</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color_id" class="mx-3 text-blue-400 rounded-full" value="5">
	                                <span class="p-2 bg-blue-400 rounded-full"> </span>
	                                <span class="ml-2">ブルー</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color_id" class="mx-3 text-blue-400 rounded-full" value="6">
	                                <span class="p-2 bg-yellow-300 rounded-full"> </span>
	                                <span class="ml-2">イエロー</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color_id" class="mx-3 text-blue-400 rounded-full" value="7">
	                                <span class="p-2 bg-orange-400 rounded-full"> </span>
	                                <span class="ml-2">オレンジ</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color_id" class="mx-3 text-blue-400 rounded-full" value="8">
	                                <span class="p-2 bg-yellow-800 rounded-full"> </span>
	                                <span class="ml-2">ブラウン</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color_id" class="mx-3 text-blue-400 rounded-full" value="9">
	                                <span class="p-2 bg-orange-100 rounded-full"> </span>
	                                <span class="ml-2">ベージュ</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color_id" class="mx-3 text-blue-400 rounded-full" value="10">
	                                <span class="p-2 bg-gray-400 rounded-full"> </span>
	                                <span class="ml-2">グレー</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color_id" class="mx-3 text-blue-400 rounded-full" value="11">
	                                <span class="p-2 bg-pink-400 rounded-full"> </span>
	                                <span class="ml-2">ピンク</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color_id" class="mx-3 text-blue-400 rounded-full" value="12">
	                                <span class="p-2 bg-lime-700 rounded-full"> </span>
	                                <span class="ml-2">カーキ</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color_id" class="mx-3 text-blue-400 rounded-full" value="13">
	                                <span class="p-2 bg-indigo-800 rounded-full"> </span>
	                                <span class="ml-2">ネイビー</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color_id" class="mx-3 text-blue-400 rounded-full" value="14">
	                                <span class="p-2 bg-purple-400 rounded-full"> </span>
	                                <span class="ml-2">パープル</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color_id" class="mx-3 text-blue-400 rounded-full" value="15">
	                                <span class="p-2 bg-teal-200 rounded-full"> </span>
	                                <span class="ml-2">パステルグリーン</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color_id" class="mx-3 text-blue-400 rounded-full" value="16">
	                                <span class="p-2 bg-cyan-200 rounded-full"> </span>
	                                <span class="ml-2">パステルブルー</span>
	                            </label>
	                        </li>
	                        <li class="my-1">
	                            <label class="inline-flex items-center">
	                                <input type="checkbox" name="color_id" class="mx-3 text-blue-400 rounded-full" value="17">
	                                <span >その他</span>
	                            </label>
	                        </li>
	                    </ul>
	                <div class="flex justify-end mt-3">
	                	<button type="button" class="px-3 mr-3 font-semibold text-blue-400 border border-blue-400 rounded-full focus:outline-none" onclick="uncheckColorAll()">クリア</button>
	                    <button type="submit" class="px-3 mr-3 font-semibold text-white bg-blue-400 border rounded-full focus:outline-none">検索する</button>
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
                <p class="text-2xl my-8"><c:out value="${message}" /></p>
                <c:if test="${targetProducts == 0}">
	                <p class="text-red-500 text-lg font-normal">条件に一致する商品は見つかりませんでした</p>
	                <div class="rounded-lg bg-gray-300 p-6 mt-6">
	                    <p class="font-bold text-lg text-gray-500">検索のヒント</p>
	                    <div class="text-gray-600 mt-3">
	                        <span>・条件に間違いがないか確認する</span>
	                        <span class="ml-4">・条件の数を減らしてみる</span>
	                    </div>
	                </div>
                </c:if>
            </section>
            <!-- Product Description End -->
            <!-- Products List -->
            <ul class="grid grid-cols-3 lg:grid-cols-5 gap-4 mt-5 sm:ml-5 lg:ml-0 lg:justify-center">
                <c:forEach var="product" items="${data}">
                	<li class="flex flex-col w-40 transition duration-400 hover:bg-gray-100">
                		<a href="getProductDetail?product_id=${product.product_id}">
                			<img class="w-full h-44" src="images/${product.product_image}" alt="${product.product_name}">
                		</a>
	                    <div class="p-4">
	                        <p class="mb-1 font-bold text-md">${product.product_name}</p>
	                        <p class="text-xl text-red-500 font-bold">\ ${product.price}</p>
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
</html>