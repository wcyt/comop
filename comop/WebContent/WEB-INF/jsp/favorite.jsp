<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- js -->
    <script src="./js/headerAndFooter.js"></script>
    <!-- js -->
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
    <!-- Main -->
    <main id="main" class="grid grid-cols-12 py-16 bg-white sm:px-4 lg:px-32">
        <!-- Breadcrumbs -->
        <nav class="col-span-12 text-lg font-light breadcrumbs">
            <ul>
                <li><a>Home</a></li>
                <li><a>お気に入りアイテム</a></li>
            </ul>
        </nav>
        <!-- Breadcrumbs End -->
        <!-- Dropdowns -->
        <div class="col-span-12">
            <h1 class="my-5 text-3xl font-bold">ユーザ名さんのお気に入り</h1>
            <div class="flex flex-row">
                <p class="text-3xl">2</p>
                <p class="px-1 pr-5 mt-3 border-r-2">件</p>
                <div class="dropdown dropdown-hover">
                    <div tabindex="0" class="pt-2 m-1 mx-5 font-bold text-center text-black bg-white text-md">すべてのショップ</div>
                    <ul tabindex="0" class="w-40 py-2 bg-white rounded-2xl menu dropdown-content">
                        <li><a class="bg-gray-200">すべてのショップ</a></li>
                        <li><a>Item 2</a></li>
                        <li><a>Item 3</a></li>
                    </ul>
                </div>
                <div class="dropdown dropdown-hover">
                    <div tabindex="0" class="pt-2 m-1 mx-5 font-bold text-center text-black bg-white text-md">すべてのカテゴリー</div>
                    <ul tabindex="0" class="w-40 py-2 bg-white rounded-2xl menu dropdown-content">
                        <li><a class="bg-gray-200">すべてのカテゴリー</a></li>
                        <li><a>Item 2</a></li>
                        <li><a>Item 3</a></li>
                    </ul>
                </div>
                <div class="dropdown dropdown-hover">
                    <div tabindex="0" class="pt-2 m-1 mx-5 font-bold text-center text-black bg-white text-md">すべての価格タイプ</div>
                    <ul tabindex="0" class="w-40 py-2 bg-white rounded-2xl menu dropdown-content">
                        <li><a class="bg-gray-200">すべての価格タイプ</a></li>
                        <li><a>Item 2</a></li>
                        <li><a>Item 3</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Dropdowns End -->
        <!-- Products -->
        <div class="col-span-12 mt-6">
            <ul class="flex flex-row flex-wrap gap-7">
                <li class="flex flex-col transition w-52 duration-400 hover:bg-gray-100">
                    <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                    <div class="p-4 ">
                        <p class="mb-1 font-bold text-md">NIKE</p>
                        <p class="mb-2 font-light">スニーカー</p>
                        <p class="text-xl font-bold">\11,000</p>
                    </div>
                </li>
                <li class="flex flex-col transition w-52 duration-400 hover:bg-gray-100">
                    <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                    <div class="p-4 ">
                        <p class="mb-1 font-bold text-md">NIKE</p>
                        <p class="mb-2 font-light">スニーカー</p>
                        <p class="text-xl font-bold">\11,000</p>
                    </div>
                </li>
                <li class="flex flex-col transition w-52 duration-400 hover:bg-gray-100">
                    <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                    <div class="p-4 ">
                        <p class="mb-1 font-bold text-md">NIKE</p>
                        <p class="mb-2 font-light">スニーカー</p>
                        <p class="text-xl font-bold">\11,000</p>
                    </div>
                </li>
            </ul>
        </div>
        <!-- Products End -->
    </main>
    <!-- Main End -->
</body>

</html>