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
    <!--  tailwind css -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@1.16.2/dist/full.css" rel="stylesheet" type="text/css" />
    <!-- tailwind css -->
    <title>トップページ</title>
</head>
<script>
function r_check(){
	const inputValue = document.search_reward_form.key.value;
	if(inputValue == "" || !inputValue.match(/\S/g)){
		return false;
	}
}
</script>

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
            <form method="get" action="searchRewardProducts" name="search_reward_form" onsubmit="return r_check()" class="w-1/2  sm:my-1">
		         <!-- Search Input -->
		         	<div class="flex flex-row bg-gray-100 rounded border border-gray-200">
		         		<input type="search" name="key" placeholder="ポイント商品を検索" class="bg-transparent py-4 text-gray-600 font-bold px-4 focus:outline-none w-full" />
		         		<button type="submit" class="py-1 px-6 bg-white text-gray-600 rounded-r border-l border-gray-200 hover:bg-gray-50 active:bg-gray-200 disabled:opacity-50  focus:outline-none"><i class="fa fa-search"></i></button>
		         	</div>
		         <!-- Search Input End -->
		    </form>
		    <div class="flex items-center">
			    <span class="mt-6 text-2xl">現在のポイント：</span>
			    <span class="mt-6 text-2xl text-red-500 ml-4">${user.point}P</span>
		    </div>
            <!-- Products List -->
	            <ul class="flex flex-row flex-wrap gap-6 mt-5">
					<c:forEach var="reward" items="${data}">
						<li class="flex flex-col w-64 transition duration-400 hover:bg-gray-100">
							<img class="h-44" src="images/${reward.reward_product_image}" alt="">
							<div class="p-4">
								<p class="px-3 mb-2 text-xl">${reward.reward_product_name}</p>
								<div class="my-4 px-3">
									<span class="text-2xl text-red-500 font-bold ">${reward.point_price}</span>
									<span class="text-md font-bold">ポイント</span>
								</div>
								<div tabindex="0" class="w-full collapse">
									<div class="font-medium text-md collapse-title">商品説明</div>
									<div class="collapse-content">
										<p class="text-lg">${reward.reward_product_description}</p>
									</div>
								</div>
								<c:if test="${user.user_id == null}">
									<label for="my-modal-${reward.reward_product_id}" class="btn bg-blue-300 modal-button mt-8 w-full text-lg pointer-events-none focus;outline-none border-none">交換する</label>
									<input type="checkbox" id="my-modal-${reward.reward_product_id}" class="modal-toggle">
									<div class="modal">
										<div class="modal-box">
											<div class="text-lg">
												<p>${reward.reward_product_name}を交換します。</p>
												<p class="text-red-500">注文後、指定の住所に送られます。</p>
												<p>それでもよろしいですか？</p>
											</div>
											<div class="modal-action">
												<label for="my-modal-${reward.reward_product_id}" class="mt-3">
													<a href="addPointOrder?user_id=${user.user_id}&reward_product_id=${reward.reward_product_id}&total_point_price=${reward.point_price}" class="p-3 px-5 mt-5 font-bold text-white transition-all duration-200 bg-blue-500 rounded-md hover:bg-blue-600">はい</a>
												</label>
												<label for="my-modal-${reward.reward_product_id}" class="btn">いいえ</label>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${user.user_id != null and user.point >= reward.point_price }">
									<label for="my-modal-${reward.reward_product_id}" class="btn btn-info modal-button mt-8 w-full text-lg">交換する</label>
									<input type="checkbox" id="my-modal-${reward.reward_product_id}" class="modal-toggle">
									<div class="modal">
										<div class="modal-box">
											<div class="text-lg">
												<p>${reward.reward_product_name}を交換します。</p>
												<p class="text-red-500">注文後、指定の住所に送られます。</p>
												<p>それでもよろしいですか？</p>
											</div>
											<div class="modal-action">
												<label for="my-modal-${reward.reward_product_id}" class="mt-3">
													<a href="addPointOrder?user_id=${user.user_id}&reward_product_id=${reward.reward_product_id}&total_point_price=${reward.point_price}" class="p-3 px-5 mt-5 font-bold text-white transition-all duration-200 bg-blue-500 rounded-md hover:bg-blue-600">はい</a>
												</label>
												<label for="my-modal-${reward.reward_product_id}" class="btn">いいえ</label>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${user.user_id != null and user.point < reward.point_price }">
									<label for="my-modal-${reward.reward_product_id}" class="btn btn-info modal-button mt-8 w-full text-lg">交換する</label>
									<input type="checkbox" id="my-modal-${reward.reward_product_id}" class="modal-toggle">
									<div class="modal">
										<div class="modal-box">
											<div class="text-lg">
												<p>ポイントが足りません</p>
											</div>
											<div class="modal-action">
												<label for="my-modal-${reward.reward_product_id}" class="btn">もどる</label>
											</div>
										</div>
									</div>
								</c:if>
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