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
    <main id="main" class="grid grid-cols-12 py-16 bg-white sm:px-4 lg:px-32">
        <h1 class="col-span-12 text-2xl font-bold">COMOP</h1>
        <div class="col-span-12 lg:col-span-8">
            <div class="flex flex-row pb-8 mt-5 text-2xl border-b-2">
                <h2 class="">お届け先・配送方法・お支払い方法</h1>
            </div>
        </div>
        <!-- Breadcrumbs End -->
        <!-- Shipping address, delivery method, and payment method -->
        <div class="col-span-12 lg:col-span-8">
            <form method="" action="" class="flex flex-col">
                <!-- Name -->
                <div class="grid grid-cols-12 py-5 border-gray-400">
                    <div class="flex flex-row items-center col-span-4 lg:col-span-3">
                        <span class="text-lg">お名前</span>
                        <span class="ml-4 font-bold text-red-600">必須</span>
                    </div>
                    <div class="flex flex-row col-span-8 gap-5 lg:col-span-9">
                        <input type="text" name="" placeholder="例）上尾" autocomplete="family-name" class="w-1/2">
                        <input type="text" name="" placeholder="太郎" autocomplete="given-name" class="w-1/2">
                    </div>
                </div>
                <!-- Name End -->
                <!-- Name(kana) -->
                <div class="grid grid-cols-12 py-5 border-gray-400">
                    <div class="flex flex-row items-center col-span-4 lg:col-span-3">
                        <div class="flex flex-col lg:flex-row">
                            <span class="text-lg">お名前</span>
                            <span class="text-lg">（カナ）</span>
                        </div>
                        <span class="ml-4 font-bold text-red-600">必須</span>
                    </div>
                    <div class="flex flex-row col-span-8 gap-5 lg:col-span-9">
                        <input type="text" name="" placeholder="例）アゲオ" class="w-1/2">
                        <input type="text" name="" placeholder="タロウ" class="w-1/2">
                    </div>
                </div>
                <!-- Name(kana) End -->
                <!-- Postal Code -->
                <div class="grid grid-cols-12 py-5 border-gray-400">
                    <div class="flex flex-row items-center col-span-4 lg:col-span-3">
                        <span class="text-lg">郵便番号</span>
                        <span class="ml-4 font-bold text-red-600">必須</span>
                    </div>
                    <div class="flex flex-row items-center col-span-8 gap-5 lg:col-span-9">
                        <input type="text" name="postalCode" autocomplete="postal-code" class="w-1/2">
                        <a href="https://www.post.japanpost.jp/zipcode/index.html" class="text-blue-400 hover:underline">郵便番号を調べる<i class="ml-3 bi bi-box-arrow-up-right"></i></a>
                    </div>
                </div>
                <!-- Postal Code End -->
                <!-- Address -->
                <div class="grid grid-cols-12 py-5 border-gray-400">
                    <div class="flex flex-row items-center col-span-4 lg:col-span-3">
                        <span class="text-lg">住所1</span>
                        <span class="ml-4 font-bold text-red-600">必須</span>
                    </div>
                    <div class="flex flex-row items-center col-span-8 gap-5 lg:col-span-9">
                        <input type="text" name="address" class="w-1/2">
                    </div>
                </div>
                <!-- Address End -->
                <!-- Tel -->
                <div class="grid grid-cols-12 py-5 border-b border-gray-400">
                    <div class="flex flex-row items-center col-span-4 lg:col-span-3">
                        <span class="text-lg">電話番号</span>
                        <span class="ml-4 font-bold text-red-600">必須</span>
                    </div>
                    <div class="flex flex-row items-center col-span-8 gap-5 lg:col-span-9">
                        <input type="text" name="tel" placeholder="例）09012345678" autocomplete="tel" class="w-1/2">
                    </div>
                </div>
                <!-- Tel End -->
                <!-- Payment Method Group -->
                <div class="grid grid-cols-12 py-10 border-b border-gray-400">
                    <div class="flex flex-row col-span-4 lg:col-span-3">
                        <span class="text-lg">お支払方法</span>
                    </div>
                    <div class="flex flex-col col-span-7 gap-5 lg:col-span-8">
                        <p class="col-span-12">クレジットカード</p>
                        <!-- Credit Number -->
                        <div class="flex grid flex-row items-center grid-cols-12">
                            <p class="col-span-3">クレジット番号</p>
                            <input type="text" name="tel" placeholder="半角数字のみ（ハイフンなし）" autocomplete="tel" class="col-span-9 w-72">
                        </div>
                        <!-- Credit Number End -->
                        <!-- Security Number -->
                        <div class="flex grid flex-row items-center grid-cols-12">
                            <p class="col-span-3">セキュリティ番号</p>
                            <input type="text" name="tel" placeholder="半角数字のみ" autocomplete="tel" class="col-span-9 w-72">
                        </div>
                        <!-- Security Number -->
                        <!-- Card Name -->
                        <div class="flex grid flex-row items-center grid-cols-12">
                            <p class="col-span-3">カード名義</p>
                            <input type="text" name="tel" placeholder="" autocomplete="tel" class="col-span-9 w-72">
                        </div>
                        <!-- Card Name End -->
                        <!-- Expiration Date -->
                        <div class="flex grid flex-row items-center grid-cols-12">
                            <p class="col-span-3">有効期限</p>
                            <select name="" id="" class="col-span-3 lg:col-span-2">
                                <option value="1">01</option>
                                <option value="2">02</option>
                                <option value="3">03</option>
                                <option value="4">04</option>
                                <option value="5">05</option>
                                <option value="6">06</option>
                                <option value="7">07</option>
                                <option value="8">08</option>
                                <option value="9">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                            <p class="mx-4">月</p>
                            <select name="" id="" class="col-span-3 lg:col-span-2">
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="31">31</option>
                            </select>
                            <p class="mx-4">日</p>
                        </div>
                        <!-- Expiration Date End -->
                    </div>
                    <div class="col-span-1">
                        <label class="inline-flex items-center">
                            <span class="text-lg font-light">\0</span>
                        </label>
                    </div>
                </div>
                <!-- Payment Method Group End -->
            </form>
        </div>
        <!-- Shipping address, delivery method, and payment method End -->
        <!--  -->
        <div class="col-span-12 mt-8 lg:mt-0 lg:ml-10 lg:col-span-4">
            <div class="sticky top-0 px-6 bg-gray-100 border-2 border-blue-300 rounded-lg shadow">
                <button type="submit" class="w-full py-3 my-6 text-xl font-bold text-white bg-blue-400 rounded-md">次へ進む</button>
                <div class="flex justify-between py-3 border-b border-gray-400">
                    <span>商品合計</span>
                    <span>\4241</span>
                </div>
                <div class="flex justify-between py-3">
                    <div>
                        <span class="text-xl font-bold">合計</span>
                        <span class="text-sm font-light">(税込)</span>
                    </div>
                    <span class="text-xl font-bold text-red-600">\4241</span>
                </div>
            </div>
        </div>
    </main>
    <!-- Main End -->
    <footer class="py-10 bg-gray-200">
        <p class="flex justify-center text-gray-400">© COMOP , Inc.</p>
    </footer>
</body>

</html>