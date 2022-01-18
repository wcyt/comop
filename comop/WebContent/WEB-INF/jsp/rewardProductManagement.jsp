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
<title>ポイント商品の一覧・追加</title>
</head>

<body>
	<!-- Main -->
	<main id="main" class="grid grid-cols-12 gap-6 py-16 bg-white sm:px-4 lg:px-16">
		<div class="flex justify-center col-span-12">
			<a href="admin" class="px-6 py-1 text-white bg-gray-400 rounded-full">管理ページTOP</a>
		</div>
		<div class="flex flex-col items-center col-span-12 gap-3">
			<h1 class="text-2xl font-bold text-center">ポイント商品登録</h1>
		</div>
		<!-- Product Management -->
		<div class="col-span-12 lg:col-span-6">
			<form action="addRewardProduct" method="post">
				<div class="flex flex-col gap-2 px-6 font-normal border-2 border-gray-300 rounded-xl">
					<p class="py-3 text-xl text-center border-b-2 border-gray-300">ポイント商品管理</p>
					<!-- Product Name -->
					<div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
						<div class="flex items-center col-span-3 text-center">
							<p class="font-bold text-right">ポイント商品名</p>
						</div>
						<div class="col-span-9">
							<input type="text" name="reward_product_name" id="" class="w-full rounded-xl">
						</div>
					</div>
					<!-- Product Name End -->
					<!-- Product Image -->
					<div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
						<div class="flex items-center col-span-3 text-center">
							<p class="font-bold text-right">ポイント商品画像</p>
						</div>
						<div class="col-span-9">
							<input type="text" name="reward_product_image" id="" class="w-full rounded-xl">
						</div>
					</div>
					<!-- Product Image End -->
					<!-- Product Description -->
					<div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
						<div class="flex items-center col-span-3 text-center">
							<p class="font-bold text-right">ポイント商品説明</p>
						</div>
						<div class="col-span-9">
							<textarea name="reward_product_description" class="w-full border-black textarea textarea-bordered" placeholder=""></textarea>
						</div>
					</div>
					<!-- Product Description End -->
					<!-- Stock -->
					<div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
						<div class="flex items-center col-span-3 text-center">
							<p class="font-bold text-right">在庫数</p>
						</div>
						<div class="col-span-9">
							<input type="text" name="stock_quantity" id="" class="w-full rounded-xl">
						</div>
					</div>
					<!-- Stock End -->
					<!-- Point Price -->
					<div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
						<div class="flex items-center col-span-3 text-center">
							<p class="font-bold text-right">交換ポイント数</p>
						</div>
						<div class="col-span-9">
							<input type="text" name="point_price" id="" inputmode="numeric" pattern="\d*" class="w-full rounded-xl">
						</div>
					</div>
					<!-- Point Price End -->
					<!-- Registration Button -->
					<div class="flex justify-center my-4">
						<button type="submit" class="max-w-lg px-32 py-2 text-center text-white bg-gray-400 rounded-full">登録する</button>
					</div>
					<!-- Registration Button End -->
				</div>
			</form>
		</div>
		<!-- Product Management End -->
		<!-- Add Image -->
		<div class="col-span-12 lg:col-span-6">
			<form action="" method="">
				<div class="flex flex-col gap-2 px-6 font-normal border-2 border-gray-300 rounded-xl">
					<p class="py-3 text-xl text-center border-b-2 border-gray-300">画像の追加</p>
					<!-- Product ID -->
					<div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
						<div class="flex items-center col-span-3 text-center">
							<p class="font-bold text-right">画像のパス</p>
						</div>
						<div class="col-span-9">
							<input type="text" name="" id="" class="w-full rounded-xl">
						</div>
					</div>
					<!-- Product ID End -->
					<!-- Product Name -->
					<div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
						<div class="flex items-center col-span-3 text-center">
							<p class="font-bold text-right">ポイント商品ID</p>
						</div>
						<div class="col-span-9">
							<input type="text" name="" id="" class="w-full rounded-xl">
						</div>
					</div>
					<!-- Product Name End -->
					<!-- Registration Button -->
					<div class="flex justify-center my-4">
						<a href="" class="max-w-lg px-32 py-2 text-center text-white bg-gray-400 rounded-full">登録する</a>
					</div>
					<!-- Registration Button End -->
				</div>
			</form>
		</div>
		<!-- Add Image End -->
		<!-- Product List -->
		<div class="col-span-12 overflow-x-auto">
			<h2 class="my-5 text-2xl font-bold text-center">ポイント商品一覧</h2>
			<table class="table w-full text-center table-auto">
				<thead>
					<tr>
						<th>ポイント商品ID</th>
						<th>ポイント商品名</th>
						<th>ポイント商品画像</th>
						<th>ポイント商品説明</th>
						<th>交換ポイント数</th>
						<th>在庫数</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="rewardProducts" items="${data}">
						<tr class="hover">
							<th>${rewardProducts.reward_product_id}</th>
							<td>${rewardProducts.reward_product_name}</td>
							<td>${rewardProducts.reward_product_image}</td>
							<td>${rewardProducts.reward_product_description}</td>
							<td>${rewardProducts.point_price}</td>
							<td>${rewardProducts.stock_quantity}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- Product List End -->
	</main>
	<!-- Main End -->
</body>


</html>