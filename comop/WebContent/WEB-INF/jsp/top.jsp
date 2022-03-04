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
    <link href="https://cdn.jsdelivr.net/npm/daisyui@1.16.1/dist/full.css" rel="stylesheet" type="text/css" />
    <!-- tailwind css -->
    <title>comop</title>
</head>
<script>
window.addEventListener('DOMContentLoaded', function() {
	const url = location.href;
	const origin = location.origin + "/comop/";
	if (url === origin || url === origin + "login") { window.location.href = '/comop/top'; }
});
</script>

<body>
	<%@include file="Header.jsp" %>
    <!-- Main -->
    <main id="main" class="grid grid-cols-12 py-16 bg-gray-100 sm:px-4 lg:px-32">
        <!-- Search List -->
        <aside class="col-span-3 lg:col-span-2">
        	<p class="my-4 pt-6 text-xl font-bold">商品一覧から探す</p>
            <ul>
            	<li class="my-3 font-normal"><a href="refineSearch?pmin=0&pmax=5000">商品一覧から探す</a></li>
               	<li class="my-3 font-normal"><a href="getRewardProductsList">ポイント商品一覧から探す</a></li>
            </ul>
        	<p class="my-4 pt-6 text-xl font-bold">サイズから探す</p>
            <ul>
                <li class="my-3 font-normal"><a href="refineSearch?size=キッズ&pmin=0&pmax=10000">キッズで探す</a></li>
                <li class="my-3 font-normal"><a href="refineSearch?size=小さめ&pmin=0&pmax=10000">小さめで探す</a></li>
                <li class="my-3 font-normal"><a href="refineSearch?size=ふつう&pmin=0&pmax=10000">ふつうで探す</a></li>
            </ul>
            <p class="my-4 pt-6 text-xl font-bold">素材から探す</p>
            <ul>
                <li class="my-3 font-normal"><a href="refineSearch?material=布&pmin=0&pmax=10000">布で探す</a></li>
                <li class="my-3 font-normal"><a href="refineSearch?material=不織布&pmin=0&pmax=10000">不織布で探す</a></li>
                <li class="my-3 font-normal"><a href="refineSearch?material=ウレタン&pmin=0&pmax=10000">ウレタンで探す</a></li>
            </ul>
			<p class="my-4 pt-6 text-xl font-bold">包装タイプから探す</p>
            <ul>
            	<li class="my-3 font-normal"><a href="refineSearch?pmin=0&pmax=10000&packing_type=個別包装">個別包装で探す</a></li>
               	<li class="my-3 font-normal"><a href="refineSearch?pmin=0&pmax=10000&packing_type=大容量">大容量で探す</a></li>
            </ul>
            <p class="my-4 pt-6 text-xl font-bold">価格・お気に入り数から探す</p>
            <ul>
            	<li class="my-3 font-normal"><a href="refineSearch?pmin=0&pmax=10000&sort=asc">価格が低い順で探す</a></li>
               	<li class="my-3 font-normal"><a href="refineSearch?pmin=0&pmax=10000&sort=desc">価格が高い順で探す</a></li>
               	<li class="my-3 font-normal"><a href="refineSearch?pmin=0&pmax=10000&sort=favorite">お気に入り数が多い順で探す</a></li>
            </ul>
        </aside>
        <!-- Search List End -->
        <!-- Article -->
        <article class="col-span-9 lg:col-span-10">
            <!-- Generation Item Ranking -->
            <section class="mt-3.5">
                <p class="pt-6 text-2xl font-bold">お気に入り数ランキング</p>
                <ul class="flex w-full mt-5 overflow-visible overflow-x-auto">
                	<c:forEach begin="1" end="10" var="product" items="${favoriteCountList}">
	                	<li class="bg-white">
	                        <div class="flex flex-col w-52">
	                            <a href="getProductDetail?product_id=${product.product_id}">
		                			<img class="w-full h-44 object-contain" src="images/${product.product_image}" alt="${product.product_name}">
		                		</a>
	                            <div class="p-4">
	                                <p class="mb-1 font-bold text-md">${product.product_name }</p>
	                                <p class="text-xl font-bold">\ ${product.price }</p>
	                            </div>
	                        </div>
	                    </li>
                	</c:forEach>
                </ul>
            </section>
            <!-- Generation Item Ranking End -->
            <!-- Item Line-Up -->
            <section class="mt-10">
                <p class="pt-6 text-2xl font-bold">商品ラインナップ</p>
                <ul class="flex w-full mt-5 overflow-visible overflow-x-auto">
                    <c:forEach begin="1" end="10" var="product" items="${randomProductList}">
	                	<li class="bg-white">
	                        <div class="flex flex-col w-52">
	                            <a href="getProductDetail?product_id=${product.product_id}">
		                			<img class="w-full h-44" src="images/${product.product_image}" alt="${product.product_name}">
		                		</a>
	                            <div class="p-4">
	                                <p class="mb-1 font-bold text-md">${product.product_name}</p>
	                                <p class="text-xl font-bold">\ ${product.price}</p>
	                            </div>
	                        </div>
	                    </li>
                	</c:forEach>
                </ul>
            </section>
            <!-- Item Line-Up End -->
				<c:if test="${!empty user.name and !empty favoriteList}">
		        	<section class="mt-10">
		                <p class="pt-6 text-2xl font-bold">お気に入り商品</p>
		                <ul class="flex w-full mt-5 overflow-visible overflow-x-auto">
		                	<c:forEach var="product" items="${favoriteList}">
			                	<li class="bg-white">
			                        <div class="flex flex-col w-52">
			                            <a href="getProductDetail?product_id=${product.product_id}">
				                			<img class="w-full h-44" src="images/${product.product_image}" alt="${product.product_name}">
				                		</a>
			                            <div class="p-4 bg-white">
			                                <p class="mb-1 font-bold text-md">${product.product_name }</p>
			                                <p class="text-xl font-bold">\ ${product.price }</p>
			                            </div>
			                        </div>
			                    </li>
		                	</c:forEach>
		                </ul>
		            </section>
				</c:if>
        </article>
        <!-- Article End -->
    </main>
    <!-- Main End -->
    <%@include file="Footer.jsp" %>
</body>

</html>