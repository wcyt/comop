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


<body>
	<%@include file="Header.jsp" %>
    <!-- Main -->
    <main id="main" class="grid grid-cols-12 py-16 bg-gray-100 sm:px-4 lg:px-32">
        <!-- Search List -->
        <aside class="col-span-3 lg:col-span-2">
            <ul class="pt-6">
                <p class="my-4 text-xl font-bold">カテゴリから探す</p>
                <li class="my-3 font-normal">サイズで探す</li>
                <li class="my-3 font-normal">素材で探す</li>
                <li class="my-3 font-normal">梱包方法で探す</li>
                <li class="my-3 font-normal"><a href="getProductsList">商品一覧を見る</a></li>
                <li class="my-3 font-normal"><a href="sortProducts">価格順で見る</a></li>
                <li class="my-3 font-normal"><a href="getRewardProductsList">ポイント商品を見る</a></li>
            </ul>
            <ul class="flex flex-col pt-6">
                <p class="my-4 text-2xl font-bold">お気に入り</p>
                <div class="z-10 px-4 py-3 dropdown dropdown-right dropdown-hover hover:bg-gray-200">
                    <p tabindex="0" class="font-normal">Item 0</p>
                    <ul tabindex="0" class="bg-white shadow menu dropdown-content w-52">
                        <li><a>Item 0</a></li>
                        <li><a>Item 0</a></li>
                        <li><a>Item 0</a></li>
                    </ul>
                </div>
                <div class="z-10 px-4 py-3 dropdown dropdown-right dropdown-hover hover:bg-gray-200">
                    <p tabindex="1" class="font-normal">Item 1</p>
                    <ul tabindex="1" class="bg-white shadow menu dropdown-content w-52">
                        <li><a>Item 1</a></li>
                        <li><a>Item 1</a></li>
                        <li><a>Item 1</a></li>
                    </ul>
                </div>
            </ul>
        </aside>
        <!-- Search List End -->
        <!-- Article -->
        <article class="col-span-9 lg:col-span-10">
            <!-- Generation Item Ranking -->
            <section class="mt-10">
                <p class="pt-6 text-2xl font-bold">閲覧数ランキング</p>
                <ul class="flex w-full mt-5 overflow-visible overflow-x-auto">
                    <li class="">
                        <div class="flex flex-col w-52">
                            <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                            <div class="p-4 bg-white">
                                <p class="mb-1 font-bold text-md">NIKE</p>
                                <p class="mb-2 font-light">スニーカー</p>
                                <p class="text-xl font-bold">\11,000</p>
                            </div>
                        </div>
                    </li>
                    <li class="">
                        <div class="flex flex-col w-52">
                            <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                            <div class="p-4 bg-white">
                                <p class="mb-1 font-bold text-md">NIKE</p>
                                <p class="mb-2 font-light">スニーカー</p>
                                <p class="text-xl font-bold">\11,000</p>
                            </div>
                        </div>
                    </li>
                    <li class="">
                        <div class="flex flex-col w-52">
                            <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                            <div class="p-4 bg-white">
                                <p class="mb-1 font-bold text-md">NIKE</p>
                                <p class="mb-2 font-light">スニーカー</p>
                                <p class="text-xl font-bold">\11,000</p>
                            </div>
                        </div>
                    </li>
                    <li class="">
                        <div class="flex flex-col w-52">
                            <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                            <div class="p-4 bg-white">
                                <p class="mb-1 font-bold text-md">NIKE</p>
                                <p class="mb-2 font-light">スニーカー</p>
                                <p class="text-xl font-bold">\11,000</p>
                            </div>
                        </div>
                    </li>
                    <li class="">
                        <div class="flex flex-col w-52">
                            <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                            <div class="p-4 bg-white">
                                <p class="mb-1 font-bold text-md">NIKE</p>
                                <p class="mb-2 font-light">スニーカー</p>
                                <p class="text-xl font-bold">\11,000</p>
                            </div>
                        </div>
                    </li>
                </ul>
            </section>
            <!-- Generation Item Ranking End -->
            <!-- Item Line-Up -->
            <section class="mt-10">
                <p class="pt-6 text-2xl font-bold">商品ラインナップ</p>
                <ul class="flex w-full mt-5 overflow-visible overflow-x-auto">
                    <li class="">
                        <div class="flex flex-col w-52">
                            <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                            <div class="p-4 bg-white">
                                <p class="mb-1 font-bold text-md">NIKE</p>
                                <p class="mb-2 font-light">スニーカー</p>
                                <p class="text-xl font-bold">\11,000</p>
                            </div>
                        </div>
                    </li>
                    <li class="">
                        <div class="flex flex-col w-52">
                            <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                            <div class="p-4 bg-white">
                                <p class="mb-1 font-bold text-md">NIKE</p>
                                <p class="mb-2 font-light">スニーカー</p>
                                <p class="text-xl font-bold">\11,000</p>
                            </div>
                        </div>
                    </li>
                    <li class="">
                        <div class="flex flex-col w-52">
                            <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                            <div class="p-4 bg-white">
                                <p class="mb-1 font-bold text-md">NIKE</p>
                                <p class="mb-2 font-light">スニーカー</p>
                                <p class="text-xl font-bold">\11,000</p>
                            </div>
                        </div>
                    </li>
                    <li class="">
                        <div class="flex flex-col w-52">
                            <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                            <div class="p-4 bg-white">
                                <p class="mb-1 font-bold text-md">NIKE</p>
                                <p class="mb-2 font-light">スニーカー</p>
                                <p class="text-xl font-bold">\11,000</p>
                            </div>
                        </div>
                    </li>
                    <li class="">
                        <div class="flex flex-col w-52">
                            <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                            <div class="p-4 bg-white">
                                <p class="mb-1 font-bold text-md">NIKE</p>
                                <p class="mb-2 font-light">スニーカー</p>
                                <p class="text-xl font-bold">\11,000</p>
                            </div>
                        </div>
                    </li>
                </ul>
            </section>
            <!-- Item Line-Up End -->
        </article>
        <!-- Article End -->
    </main>
    <!-- Main End -->
    <%@include file="Footer.jsp" %>
</body>

</html>