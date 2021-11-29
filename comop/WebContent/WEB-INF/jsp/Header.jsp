<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<!-- Header -->
	<header class="fixed z-50 flex flex-col items-center justify-between w-full sm:px-4 bg-gray-100 lg:flex-row lg:px-32">
		<!-- SiteName And Search Input -->
		<form class="flex flex-row sm:my-1">
			<!-- SiteName -->
			<p class="inline mt-3 mb-3 font-bold text-center">サイト名予定地</p>
			<!-- SiteName End -->
			<!-- Search Input -->
			<div class="flex flex-row ml-10 bg-white rounded-lg">
				<button class="focus:outline-none focus:ring-white">
					<i class="ml-5 mr-3 bi bi-search"></i>
				</button>
				<input type="search" placeholder="すべてのアイテムから探す" class="border-none outline-none w-96 rounded-2xl focus:outline-none focus:ring-white">
			</div>
			<!-- Search Input End -->
		</form>
		<!-- Site Name And Search Input End-->
		<!-- Menu -->
		<div class="flex flex-row">
			<a href="signIn" class="px-5 py-3 font-medium transition text-md duration-400 hover:bg-gray-300 hover:text-black">ログイン</a>
			<!-- ログインしてない時はベル・ハート・カートを消す -->
			<a href="getFavoriteList" class="px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-suit-heart"></i></a>
			<a href="getCartList" class="px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-cart"></i></a>
		</div>
		<!-- Menu End -->
	</header>
	<!-- Header End -->
</body>
</html>