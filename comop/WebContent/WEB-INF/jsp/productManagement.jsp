<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- js -->
    <!-- <script src="./js/headerAndFooter.js"></script> -->
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
    <title>Document</title>
</head>

<body>
    <!-- Main -->
    <main id="main" class="grid grid-cols-12 gap-6 py-16 bg-white sm:px-4 lg:px-16">
        <div class="flex justify-center col-span-12">
            <button class="px-6 py-1 text-white bg-gray-400 rounded-full">管理ページTOP</button>
        </div>
        <div class="flex flex-col items-center col-span-12 gap-3">
            <h1 class="text-2xl font-bold text-center">商品登録</h1>
        </div>
        <!-- Product Management -->
        <div class="col-span-12 lg:col-span-6">
            <form action="" method="">
                <div class="flex flex-col gap-2 px-6 font-normal border-2 border-gray-300 rounded-xl">
                    <p class="py-3 text-xl text-center border-b-2 border-gray-300">商品管理</p>
                    <!-- Product ID -->
                    <div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
                        <div class="flex items-center col-span-3 text-center">
                            <p class="font-bold text-right">商品ID</p>
                        </div>
                        <div class="col-span-9">
                            <input type="text" name="" id="" class="w-full rounded-xl">
                        </div>
                    </div>
                    <!-- Product ID End -->
                    <!-- Product Name -->
                    <div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
                        <div class="flex items-center col-span-3 text-center">
                            <p class="font-bold text-right">商品名</p>
                        </div>
                        <div class="col-span-9">
                            <input type="text" name="" id="" class="w-full rounded-xl">
                        </div>
                    </div>
                    <!-- Product Name End -->
                    <!-- Product Image -->
                    <div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
                        <div class="flex items-center col-span-3 text-center">
                            <p class="font-bold text-right">商品画像</p>
                        </div>
                        <div class="col-span-9">
                            <input type="text" name="" id="" class="w-full rounded-xl">
                        </div>
                    </div>
                    <!-- Product Image End -->
                    <!-- Stock -->
                    <div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
                        <div class="flex items-center col-span-3 text-center">
                            <p class="font-bold text-right">在庫数</p>
                        </div>
                        <div class="col-span-9">
                            <input type="text" name="" id="" class="w-full rounded-xl">
                        </div>
                    </div>
                    <!-- Stock End -->
                    <!-- Product Description -->
                    <div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
                        <div class="flex items-center col-span-3 text-center">
                            <p class="font-bold text-right">商品説明</p>
                        </div>
                        <div class="col-span-9">
                            <textarea class="w-full border-black textarea textarea-bordered" placeholder=""></textarea>
                        </div>
                    </div>
                    <!-- Product Description End -->
                    <!-- Price -->
                    <div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
                        <div class="flex items-center col-span-3 text-center">
                            <p class="font-bold text-right">値段</p>
                        </div>
                        <div class="col-span-9">
                            <input type="text" name="" id="" inputmode="numeric" pattern="\d*" class="w-full rounded-xl">
                        </div>
                    </div>
                    <!-- Price End -->
                    <!-- Color ID -->
                    <div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
                        <div class="flex items-center col-span-3 text-center">
                            <p class="font-bold text-right">カラーID</p>
                        </div>
                        <div class="col-span-9">
                            <input type="text" name="" id="" class="w-full rounded-xl">
                        </div>
                    </div>
                    <!-- Color ID End -->
                    <!-- Size -->
                    <div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
                        <div class="flex items-center col-span-3 text-center">
                            <p class="font-bold text-right">サイズ</p>
                        </div>
                        <div class="col-span-9">
                            <input type="text" name="" id="" class="w-full rounded-xl">
                        </div>
                    </div>
                    <!-- Size End -->
                    <!-- Material -->
                    <div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
                        <div class="flex items-center col-span-3 text-center">
                            <p class="font-bold text-right">素材</p>
                        </div>
                        <div class="col-span-9">
                            <input type="text" name="" id="" class="w-full rounded-xl">
                        </div>
                    </div>
                    <!-- Material End -->
                    <!-- Packing Type -->
                    <div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
                        <div class="flex items-center col-span-3 text-center">
                            <p class="font-bold text-right">包装タイプ</p>
                        </div>
                        <div class="col-span-9">
                            <input type="text" name="" id="" class="w-full rounded-xl">
                        </div>
                    </div>
                    <!-- Packing Type End -->
                    <!-- Favorite Count -->
                    <div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
                        <div class="flex items-center col-span-3 text-center">
                            <p class="font-bold text-right">お気に入り数</p>
                        </div>
                        <div class="col-span-9">
                            <input type="text" name="" id="" class="w-full rounded-xl">
                        </div>
                    </div>
                    <!-- Favorite Count End -->
                    <!-- Registration Button -->
                    <div class="flex justify-center my-4">
                        <a href="" class="max-w-lg px-32 py-2 text-center text-white bg-gray-400 rounded-full">登録する</a>
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
                            <p class="font-bold text-right">商品ID</p>
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
            <h2 class="my-5 text-2xl font-bold text-center">商品一覧</h2>
            <div class="overflow-x-">
                <table class="table w-full text-center table-auto">
                    <thead>
                        <tr>
                            <th>商品ID</th>
                            <th>商品名</th>
                            <th>商品画像</th>
                            <th>在庫数</th>
                            <th>商品説明</th>
                            <th>値段</th>
                            <th>カラーID</th>
                            <th>サイズ（普通・小さめ・キッズ）</th>
                            <th>素材（不織布・布・ウレタン・ガーゼ）</th>
                            <th>包装タイプ（個包装・大容量）</th>
                            <th>お気に入り数</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="hover">
                            <th>1</th>
                            <td>Mask</td>
                            <td>img.jpg</td>
                            <td>1</td>
                            <td>lorem</td>
                            <td>4000</td>
                            <td>C001</td>
                            <td>S</td>
                            <td>不織布</td>
                            <td>個包装</td>
                            <td>0</td>
                        </tr>
                        <tr class="hover">
                            <th>2</th>
                            <td>Mask</td>
                            <td>img.jpg</td>
                            <td>1</td>
                            <td>lorem</td>
                            <td>4000</td>
                            <td>C001</td>
                            <td>S</td>
                            <td>不織布</td>
                            <td>個包装</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <th>3</th>
                            <td>Mask</td>
                            <td>img.jpg</td>
                            <td>1</td>
                            <td>lorem</td>
                            <td>4000</td>
                            <td>C001</td>
                            <td>S</td>
                            <td>不織布</td>
                            <td>個包装</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <th>4</th>
                            <td>Mask</td>
                            <td>img.jpg</td>
                            <td>1</td>
                            <td>lorem</td>
                            <td>4000</td>
                            <td>C001</td>
                            <td>S</td>
                            <td>不織布</td>
                            <td>個包装</td>
                            <td>0</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Product List End -->
    </main>
    <!-- Main End -->
</body>

</html>