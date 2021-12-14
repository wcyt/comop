<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.user.name == null}">
			<!-- ログイン前 -->
			<header class="fixed z-50 flex flex-col items-center justify-between w-full sm:px-4 bg-gray-100 lg:flex-row lg:px-32">
				<form class="flex flex-row sm:my-1">
					<a href="top" class="inline mt-3 mb-3 font-bold text-center">comop</a>
					<div class="flex flex-row ml-10 bg-white rounded-lg">
						<button class="focus:outline-none focus:ring-white">
							<i class="ml-5 mr-3 bi bi-search"></i>
						</button>
						<input type="search" placeholder="すべてのアイテムから探す" class="border-none outline-none w-96 rounded-2xl focus:outline-none focus:ring-white">
					</div>
				</form>
				<div class="flex flex-row">
					<a href="signIn" class="px-5 py-3 font-medium transition text-md duration-400 hover:bg-gray-300 hover:text-black">ログイン</a>
					<a class="px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-bell"></i></a>
					<a class="px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-suit-heart"></i></a>
					<a class="px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-cart"></i></a>
					<a class="px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-list"></i></a>
				</div>
			</header>
			<!-- ログイン前 -->
		</c:when>
		<c:when test="${sessionScope.user.name != null}">
			<!-- ログイン後 -->
			<header class="fixed z-50 flex flex-col items-center justify-between w-full px-4 bg-gray-100 lg:flex-row lg:px-32">
				<form class="flex flex-col lg:flex-row sm:my-1">
					<a href="top" class="inline mt-3 mb-3 font-bold text-center">comop</a>
					<div class="flex flex-row ml-10 bg-white rounded-lg">
						<button class="focus:outline-none focus:ring-white">
							<i class="ml-5 mr-3 bi bi-search"></i>
						</button>
						<input type="search" placeholder="すべてのアイテムから探す" class="border-none outline-none w-96 lg:w-72 rounded-2xl focus:outline-none focus:ring-white">
					</div>
				</form>
				<div class="flex flex-row">
					<div class="dropdown dropdown-hover">
						<p tabindex="0" class="flex items-center px-5 py-3 font-medium transition text-md duration-400 hover:bg-gray-300 hover:text-black">${sessionScope.user.name} 様</p>
						<ul tabindex="0" class="w-48 p-2 shadow menu dropdown-content bg-base-100 rounded-box">
							<li class="hover:underline"><a href="default">登録情報</a></li>
							<li class="hover:underline"><a href="/WEB-INF/jsp/orderHistory.jsp">注文履歴・発送状況</a></li>
							<li class="hover:underline"><a href="logout">ログアウト</a></li>
						</ul>
					</div>
					<a class="px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-bell"></i></a>
					<a class="px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-suit-heart"></i></a>
					<a class="px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-cart"></i></a>
					<a class="px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-list"></i></a>
				</div>
			</header>
			<!-- ログイン後 -->
		</c:when>
	</c:choose>
</body>
</html>