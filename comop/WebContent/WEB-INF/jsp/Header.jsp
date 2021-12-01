<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<c:choose>
		<!-- Header ログイン前 -->
		<c:when test="${sessionScope.user.user_name == null}">
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
					<a href="getFavoriteList" class="px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-suit-heart"></i></a> <a href="getCartList"
						class="px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-cart"></i></a>
				</div>
				<!-- Menu End -->
			</header>

		</c:when>
		<!-- Header End ログイン前-->
		<!-- ログイン後 -->
		<c:when test="${sessionScope.user.user_name != null}">
			<header class="fixed z-50 flex flex-col items-center justify-between w-full px-4 bg-gray-100 lg:flex-row lg:px-32">
				<!-- SiteName And Search Input -->
				<form class="flex flex-col lg:flex-row sm:my-1">
					<!-- SiteName -->
					<p class="inline mt-3 mb-3 font-bold text-center">サイト名予定地</p>
					<!-- SiteName End -->
					<!-- Search Input -->
					<div class="flex flex-row ml-10 bg-white rounded-lg">
						<button class="focus:outline-none focus:ring-white">
							<i class="ml-5 mr-3 bi bi-search"></i>
						</button>
						<input type="search" placeholder="すべてのアイテムから探す" class="border-none outline-none w-96 lg:w-72 rounded-2xl focus:outline-none focus:ring-white">
					</div>
					<!-- Search Input End -->
				</form>
				<!-- Site Name And Search Input End-->
				<!-- Menu -->
				<div class="flex flex-row">
					<div class="dropdown dropdown-hover">
						<p tabindex="0" class="flex items-center px-5 py-3 font-medium transition text-md duration-400 hover:bg-gray-300 hover:text-black">yw20304042様</p>
						<ul tabindex="0" class="w-48 p-2 shadow menu dropdown-content bg-base-100 rounded-box">
							<li class="hover:underline"><a href="">登録情報</a></li>
							<li class="hover:underline"><a href="">注文履歴・発送状況</a></li>
							<li class="hover:underline"><a href="">ログアウト</a></li>
						</ul>
					</div>
					<a class="px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-bell"></i></a> <a
						class="px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-suit-heart"></i></a> <a
						class="px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-cart"></i></a> <a
						class="px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-list"></i></a>
				</div>
				<!-- Menu End -->
			</header>
		</c:when>
		<!-- ログイン後 -->
	</c:choose>
</body>
</html>