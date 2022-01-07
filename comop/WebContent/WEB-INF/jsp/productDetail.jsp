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
    <title>商品名</title>
</head>

<body>
	<%@include file="Header.jsp" %>
    <!-- Main -->
    <main id="main" class="grid grid-cols-12 py-16 lg:px-32 sm:px-4">
        <!-- Breadcrumbs -->
        <nav class="col-span-12 text-lg font-light md:py-8 sm:py-4 sm:mt-24 md:mt-0 breadcrumbs">
            <ul>
                <li><a>Home</a></li>
                <li><a>Documents</a></li>
                <li>Add Document</li>
            </ul>
        </nav>
        <!-- Breadcrumbs End -->
        <!-- Product -->
        <div class="flex col-span-12 sm:flex-col md:flex-row">
            <!-- Left -->
            <div class="md:w-7/12">
                <img class="sm:w-full md:w-[575px]" src="https://picsum.photos/id/1005/575/500" width="575" height="500">
            </div>
            <!-- Left End -->
            <!-- Right -->
            <div class="md:w-5/12">
                <!-- ProductName And Price -->
                <section class="font-bold md:mt-0 sm:mt-4">
                    <h1 class="text-2xl">ナイキ エア フォース 1 '07 メンズシューズ / スニーカー/ Nike Air Force 1 '07 Men's Shoe (AF1)</h1>
                    <p class="mt-3 mb-8 text-3xl">¥11,000</p>
                </section>
                <!-- ProductName And Price End -->
                <!-- Inventory -->
                <section>
                    <div class="flex flex-row justify-between py-5 border-t border-b border-gray-300">
                        <div class="mt-3 font-extrabold text-md">
                            <span>S</span>
                            <span>/</span>
                            <span>在庫あり</span>
                        </div>
                        <button class="px-5 py-2 font-extrabold text-white transition duration-100 bg-blue-400 rounded-lg hover:bg-blue-500"><i class="pr-3 text-xl bi bi-cart"></i>カートに入れる</button>
                        <i class="mt-1 text-3xl text-gray-400 transition duration-100 bi bi-suit-heart-fill hover:text-red-400"></i>
                    </div>
                    <div class="flex flex-row justify-between py-5 border-b border-gray-300">
                        <div class="mt-3 font-extrabold text-md">
                            <span>M</span>
                            <span>/</span>
                            <span>在庫あり</span>
                        </div>
                        <button class="px-5 py-2 font-extrabold text-white transition duration-100 bg-blue-400 rounded-lg hover:bg-blue-500"><i class="pr-3 text-xl bi bi-cart"></i>カートに入れる</button>
                        <i class="mt-1 text-3xl text-gray-400 transition duration-100 bi bi-suit-heart-fill hover:text-red-400"></i>
                    </div>
                    <div class="flex flex-row justify-between py-5 border-b border-gray-300">
                        <div class="mt-3 font-extrabold text-gray-400 text-md">
                            <span>L</span>
                            <span>/</span>
                            <span>在庫なし</span>
                        </div>
                        <p class="px-5 py-2 text-lg font-extrabold text-gray-400">完売しました</p>
                        <i class="mt-1 text-3xl text-gray-400 transition duration-100 bi bi-suit-heart-fill hover:text-red-400"></i>
                    </div>
                </section>
                <!-- Inventory End -->
                <!-- Product Description -->
                <section>
                    <h1 class="mt-8 text-2xl font-bold">アイテム説明</h1>
                    <p class="mt-4 text-xl font-light">ナイキ エア フォースワン '07は、人気のバスケットボールシューズのオリジナルモデルに新たなテイストを加えた一足。 丈夫なステッチを施したオーバーレイ、大胆なカラー、適度な光沢によって個性が際立つデザインです。</p>
                </section>
                <!-- Product Description End -->
            </div>
            <!-- Right End -->
        </div>
        <!-- Product End -->
    </main>
    <!-- Main End -->
	<%@include file="Footer.jsp" %>
</body>

</html>