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
    <!-- alpine.js tailwind css -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2/dist/tailwind.min.css" rel="stylesheet" type="text/css" />
    <script src="https://unpkg.com/tailwindcss-jit-cdn"></script>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@1.16.2/dist/full.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.8.1/dist/alpine.js" defer></script>
    <!-- alpine.js tailwind css -->
    <title>トップページ</title>
</head>

<body>
	<%@include file="Header.jsp" %>
    <!-- Main -->
    <main id="main" class="grid grid-cols-12 gap-8 py-16 bg-white sm:px-4 lg:px-32">
        <!-- Breadcrumbs -->
        <nav class="col-span-12 text-lg font-light breadcrumbs">
            <ul>
                <li><a>Home</a></li>
                <li>Products List</li>
            </ul>
        </nav>
        <!-- Breadcrumbs End -->
        <!-- Side Bar -->
        <aside class="col-span-3 bg-gray-100 rounded-lg lg:col-span-2">
            <div class="p-4 text-white bg-gray-400 rounded-t-lg">
                <p class="mb-1 text-md">対象商品</p>
                <p class="inline text-4xl font-bold">49,194</p>
                <span class="">件</span>
            </div>
            <!-- Category -->
            <div class="my-8">
                <p class="pb-2 ml-3 text-xl font-bold">カテゴリー</p>
                <!-- Dropdowns -->
                <div class="w-full dropdown dropdown-right dropdown-hover hover:bg-gray-200">
                    <div tabindex="0" class="py-3 ml-7">トップス</div>
                    <ul tabindex="0" class="w-40 -ml-4 bg-white rounded-xl menu dropdown-content">
                        <li><a>Item 1</a></li>
                        <li><a>Item 2</a></li>
                        <li><a>Item 3</a></li>
                    </ul>
                </div>
                <div class="w-full dropdown dropdown-right dropdown-hover hover:bg-gray-200">
                    <div tabindex="0" class="py-3 ml-7">トップス</div>
                    <ul tabindex="0" class="w-40 -ml-4 bg-white rounded-xl menu dropdown-content">
                        <li><a>Item 1</a></li>
                        <li><a>Item 2</a></li>
                        <li><a>Item 3</a></li>
                    </ul>
                </div>
                <div class="w-full dropdown dropdown-right dropdown-hover hover:bg-gray-200">
                    <div tabindex="0" class="py-3 ml-7">トップス</div>
                    <ul tabindex="0" class="w-40 -ml-4 bg-white rounded-xl menu dropdown-content">
                        <li><a>Item 1</a></li>
                        <li><a>Item 2</a></li>
                        <li><a>Item 3</a></li>
                    </ul>
                </div>
                <div class="w-full dropdown dropdown-right dropdown-hover hover:bg-gray-200">
                    <div tabindex="0" class="py-3 ml-7">トップス</div>
                    <ul tabindex="0" class="w-40 -ml-4 bg-white rounded-xl menu dropdown-content">
                        <li><a>Item 1</a></li>
                        <li><a>Item 2</a></li>
                        <li><a>Item 3</a></li>
                    </ul>
                </div>
                <div class="w-full dropdown dropdown-right dropdown-hover hover:bg-gray-200">
                    <div tabindex="0" class="py-3 ml-7">トップス</div>
                    <ul tabindex="0" class="w-40 -ml-4 bg-white rounded-xl menu dropdown-content">
                        <li><a>Item 1</a></li>
                        <li><a>Item 2</a></li>
                        <li><a>Item 3</a></li>
                    </ul>
                </div>
                <div class="w-full dropdown dropdown-right dropdown-hover hover:bg-gray-200">
                    <div tabindex="0" class="py-3 ml-7">トップス</div>
                    <ul tabindex="0" class="w-40 -ml-4 bg-white rounded-xl menu dropdown-content">
                        <li><a>Item 1</a></li>
                        <li><a>Item 2</a></li>
                        <li><a>Item 3</a></li>
                    </ul>
                </div>
                <div class="w-full dropdown dropdown-right dropdown-hover hover:bg-gray-200">
                    <div tabindex="0" class="py-3 ml-7">トップス</div>
                    <ul tabindex="0" class="w-40 -ml-4 bg-white rounded-xl menu dropdown-content">
                        <li><a>Item 1</a></li>
                        <li><a>Item 2</a></li>
                        <li><a>Item 3</a></li>
                    </ul>
                </div>
                <div class="w-full dropdown dropdown-right dropdown-hover hover:bg-gray-200">
                    <div tabindex="0" class="py-3 ml-7">トップス</div>
                    <ul tabindex="0" class="w-40 -ml-4 bg-white rounded-xl menu dropdown-content">
                        <li><a>Item 1</a></li>
                        <li><a>Item 2</a></li>
                        <li><a>Item 3</a></li>
                    </ul>
                </div>
                <!-- Dropdowns -->
            </div>
            <!-- Category End-->
            <!-- Colors -->
            <div class="my-8">
                <p class="pb-2 ml-3 text-xl font-bold">カラー</p>
                <form class="flex flex-col">
                    <ul class="">
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
                                <span class="p-2 bg-white border rounded-full"> </span>
                                <span class="ml-2">ホワイト</span>
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
                                <span class="p-2 bg-red-400 rounded-full"> </span>
                                <span class="ml-2">レッド</span>
                            </label>
                        </li>
                        <li class="my-1">
                            <label class="inline-flex items-center">
                                <input type="checkbox" name="color" class="mx-3 text-blue-400 rounded-full">
                                <span class="p-2 bg-yellow-400 rounded-full"> </span>
                                <span class="ml-2">オレンジ</span>
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
                                <span class="p-2 bg-purple-400 rounded-full"> </span>
                                <span class="ml-2">パープル</span>
                            </label>
                        </li>
                        <li class="my-1">
                            <label class="inline-flex items-center">
                                <input type="checkbox" name="color" class="mx-3 text-blue-400 rounded-full">
                                <span class="p-2 bg-pink-400 rounded-full"> </span>
                                <span class="ml-2">ピンク</span>
                            </label>
                        </li>
                    </ul>
                    <div class="flex justify-end mt-3">
                        <button type="button" class="px-3 mr-3 font-semibold text-blue-400 border border-blue-400 rounded-full focus:outline-none" onclick="uncheckAll()">クリア</button>
                        <button type="submit" class="px-3 mr-3 font-semibold text-white bg-blue-400 border rounded-full focus:outline-none">OK</button>
                    </div>
                </form>
            </div>
            <!-- Colors End -->
        </aside>
        <!-- Side Bar End -->
        <!-- Products -->
        <article class="col-span-9">
            <!-- Product Description -->
            <section class="ml-4">
                <h1 class="text-4xl font-bold">マスク</h1>
                <p class="my-8">マスクの一覧です。</p>
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
            <ul class="flex flex-row flex-wrap gap-4 mt-5 sm:ml-5 lg:ml-0 lg:justify-center">
                <li class="flex flex-col w-40 transition duration-400 hover:bg-gray-100">
                    <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                    <div class="p-4 ">
                        <p class="mb-1 font-bold text-md">NIKE</p>
                        <p class="mb-2 font-light">スニーカー</p>
                        <p class="text-xl font-bold">\11,000</p>
                    </div>
                </li>
                <li class="flex flex-col w-40 transition duration-400 hover:bg-gray-100">
                    <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                    <div class="p-4 ">
                        <p class="mb-1 font-bold text-md">NIKE</p>
                        <p class="mb-2 font-light">スニーカー</p>
                        <p class="text-xl font-bold">\11,000</p>
                    </div>
                </li>
                <li class="flex flex-col w-40 transition duration-400 hover:bg-gray-100">
                    <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                    <div class="p-4 ">
                        <p class="mb-1 font-bold text-md">NIKE</p>
                        <p class="mb-2 font-light">スニーカー</p>
                        <p class="text-xl font-bold">\11,000</p>
                    </div>
                </li>
                <li class="flex flex-col w-40 transition duration-400 hover:bg-gray-100">
                    <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                    <div class="p-4 ">
                        <p class="mb-1 font-bold text-md">NIKE</p>
                        <p class="mb-2 font-light">スニーカー</p>
                        <p class="text-xl font-bold">\11,000</p>
                    </div>
                </li>
                <li class="flex flex-col w-40 transition duration-400 hover:bg-gray-100">
                    <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                    <div class="p-4 ">
                        <p class="mb-1 font-bold text-md">NIKE</p>
                        <p class="mb-2 font-light">スニーカー</p>
                        <p class="text-xl font-bold">\11,000</p>
                    </div>
                </li>
                <li class="flex flex-col w-40 transition duration-400 hover:bg-gray-100">
                    <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                    <div class="p-4 ">
                        <p class="mb-1 font-bold text-md">NIKE</p>
                        <p class="mb-2 font-light">スニーカー</p>
                        <p class="text-xl font-bold">\11,000</p>
                    </div>
                </li>
                <li class="flex flex-col w-40 transition duration-400 hover:bg-gray-100">
                    <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                    <div class="p-4 ">
                        <p class="mb-1 font-bold text-md">NIKE</p>
                        <p class="mb-2 font-light">スニーカー</p>
                        <p class="text-xl font-bold">\11,000</p>
                    </div>
                </li>
                <li class="flex flex-col w-40 transition duration-400 hover:bg-gray-100">
                    <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                    <div class="p-4 ">
                        <p class="mb-1 font-bold text-md">NIKE</p>
                        <p class="mb-2 font-light">スニーカー</p>
                        <p class="text-xl font-bold">\11,000</p>
                    </div>
                </li>
                <li class="flex flex-col w-40 transition duration-400 hover:bg-gray-100">
                    <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                    <div class="p-4 ">
                        <p class="mb-1 font-bold text-md">NIKE</p>
                        <p class="mb-2 font-light">スニーカー</p>
                        <p class="text-xl font-bold">\11,000</p>
                    </div>
                </li>
                <li class="flex flex-col w-40 transition duration-400 hover:bg-gray-100">
                    <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                    <div class="p-4 ">
                        <p class="mb-1 font-bold text-md">NIKE</p>
                        <p class="mb-2 font-light">スニーカー</p>
                        <p class="text-xl font-bold">\11,000</p>
                    </div>
                </li>
            </ul>
            <!-- Products List End -->
            <!-- Pagination -->
            <div class="w-full mt-10 ml-4">
                <ul class="flex flex-row flex-wrap items-center gap-8 ml-3 text-lg font-bold text-blue-400">
                    <li><a href="">1</a></li>
                    <li><a href="">2</a></li>
                    <li><a href="">3</a></li>
                    <li><a href="">4</a></li>
                    <li><a href="">5</a></li>
                    <li>…</li>
                    <li>50</li>
                    <li><button class="px-10 py-2 font-extrabold text-white bg-blue-400 rounded-md">></button></li>
                </ul>
            </div>
            <!-- Pagination End -->
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