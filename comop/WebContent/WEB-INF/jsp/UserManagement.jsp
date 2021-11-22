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
            <h1 class="text-2xl font-bold text-center">ユーザー登録</h1>
        </div>
        <!-- User Management -->
        <div class="col-span-12">
            <form action="" method="">
                <div class="flex flex-col gap-2 px-6 font-normal border-2 border-gray-300 rounded-xl">
                    <p class="py-3 text-xl text-center border-b-2 border-gray-300">ユーザー管理</p>
                    <!-- User ID -->
                    <div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
                        <div class="flex items-center col-span-3 text-center">
                            <p class="font-bold text-right">ユーザーID</p>
                        </div>
                        <div class="col-span-9">
                            <input type="text" name="" id="" class="w-full rounded-xl">
                        </div>
                    </div>
                    <!-- User ID End -->
                    <!-- Name -->
                    <div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
                        <div class="flex items-center col-span-3 text-center">
                            <p class="font-bold text-right">名前（本名）</p>
                        </div>
                        <div class="col-span-9">
                            <input type="text" name="" id="" class="w-full rounded-xl">
                        </div>
                    </div>
                    <!-- Name End -->
                    <!-- Address -->
                    <div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
                        <div class="flex items-center col-span-3 text-center">
                            <p class="font-bold text-right">住所</p>
                        </div>
                        <div class="col-span-9">
                            <input type="text" name="" id="" class="w-full rounded-xl">
                        </div>
                    </div>
                    <!-- Address -->
                    <!-- First Name -->
                    <div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
                        <div class="flex items-center col-span-3 text-center">
                            <p class="font-bold text-right">苗字</p>
                        </div>
                        <div class="col-span-9">
                            <input type="text" name="" id="" class="w-full rounded-xl">
                        </div>
                    </div>
                    <!-- First Name End -->
                    <!-- First Name(kana) -->
                    <div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
                        <div class="flex items-center col-span-3 text-center">
                            <p class="font-bold text-right">苗字（かな）</p>
                        </div>
                        <div class="col-span-9">
                            <input type="text" name="" id="" class="w-full rounded-xl">
                        </div>
                    </div>
                    <!-- First Name(kana) End -->
                    <!-- Last Name -->
                    <div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
                        <div class="flex items-center col-span-3 text-center">
                            <p class="font-bold text-right">名前</p>
                        </div>
                        <div class="col-span-9">
                            <input type="text" name="" id="" class="w-full rounded-xl">
                        </div>
                    </div>
                    <!-- Last Name End -->
                    <!-- Last Name(kana) -->
                    <div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
                        <div class="flex items-center col-span-3 text-center">
                            <p class="font-bold text-right">名前（かな）</p>
                        </div>
                        <div class="col-span-9">
                            <input type="text" name="" id="" class="w-full rounded-xl">
                        </div>
                    </div>
                    <!-- Last Name(kana) End -->
                    <!-- Tel -->
                    <div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
                        <div class="flex items-center col-span-3 text-center">
                            <p class="font-bold text-right">電話番号</p>
                        </div>
                        <div class="col-span-9">
                            <input type="text" name="" class="w-full rounded-xl">
                        </div>
                    </div>
                    <!-- Tel End -->
                    <!-- Postal Code -->
                    <div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
                        <div class="flex items-center col-span-3 text-center">
                            <p class="font-bold text-right">郵便番号</p>
                        </div>
                        <div class="col-span-9">
                            <input type="text" name="" id="" class="w-full rounded-xl">
                        </div>
                    </div>
                    <!-- Postal Code End -->
                    <!-- Password -->
                    <div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
                        <div class="flex items-center col-span-3 text-center">
                            <p class="font-bold text-right">パスワード</p>
                        </div>
                        <div class="col-span-9">
                            <input type="text" name="" id="" class="w-full rounded-xl">
                        </div>
                    </div>
                    <!-- Password End -->
                    <!-- Point -->
                    <div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
                        <div class="flex items-center col-span-3 text-center">
                            <p class="font-bold text-right">ポイント</p>
                        </div>
                        <div class="col-span-9">
                            <input type="text" name="" id="" class="w-full rounded-xl">
                        </div>
                    </div>
                    <!-- Point End -->
                    <!-- User Lapse -->
                    <div class="grid grid-cols-12 gap-4 px-5 my-4 text-lg">
                        <div class="flex items-center col-span-3 text-center">
                            <p class="font-bold text-right">ユーザー退会フラグ</p>
                        </div>
                        <div class="col-span-9">
                            <input type="text" name="" id="" class="w-full rounded-xl">
                        </div>
                    </div>
                    <!-- User Lapse End -->
                    <!-- Registration Button -->
                    <div class="flex justify-center my-4">
                        <a href="" class="max-w-lg px-32 py-2 text-center text-white bg-gray-400 rounded-full">登録する</a>
                    </div>
                    <!-- Registration Button End -->
                </div>
            </form>
        </div>
        <!-- User Management End -->
        <!-- User List -->
        <div class="col-span-12 overflow-x-auto">
            <h2 class="my-5 text-2xl font-bold text-center">ユーザー一覧</h2>
            <div class="overflow-x-">
                <table class="table w-full text-center table-auto">
                    <thead>
                        <tr>
                            <th>ユーザーID</th>
                            <th>名前</th>
                            <th>メールアドレス</th>
                            <th>住所</th>
                            <th>苗字</th>
                            <th>苗字（かな）</th>
                            <th>名前</th>
                            <th>名前（かな）</th>
                            <th>電話番号</th>
                            <th>郵便番号</th>
                            <th>パスワード</th>
                            <th>ポイント</th>
                            <th>ユーザー退会フラグ</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="hover">
                            <th>1</th>
                            <td>山田太郎</td>
                            <td>ttc@tera.house.ac.jp</td>
                            <td>東京都</td>
                            <td>山田</td>
                            <td>やまだ</td>
                            <td>太郎</td>
                            <td>たろう</td>
                            <td>09012345678</td>
                            <td>123-4567</td>
                            <td>password</td>
                            <td>100</td>
                            <td>FALSE</td>
                        </tr>
                        <tr class="hover">
                            <th>1</th>
                            <td>山田太郎</td>
                            <td>ttc@tera.house.ac.jp</td>
                            <td>東京都</td>
                            <td>山田</td>
                            <td>やまだ</td>
                            <td>太郎</td>
                            <td>たろう</td>
                            <td>09012345678</td>
                            <td>123-4567</td>
                            <td>password</td>
                            <td>100</td>
                            <td>FALSE</td>
                        </tr>
                        <tr class="hover">
                            <th>1</th>
                            <td>山田太郎</td>
                            <td>ttc@tera.house.ac.jp</td>
                            <td>東京都</td>
                            <td>山田</td>
                            <td>やまだ</td>
                            <td>太郎</td>
                            <td>たろう</td>
                            <td>09012345678</td>
                            <td>123-4567</td>
                            <td>password</td>
                            <td>100</td>
                            <td>FALSE</td>
                        </tr>
                        <tr class="hover">
                            <th>1</th>
                            <td>山田太郎</td>
                            <td>ttc@tera.house.ac.jp</td>
                            <td>東京都</td>
                            <td>山田</td>
                            <td>やまだ</td>
                            <td>太郎</td>
                            <td>たろう</td>
                            <td>09012345678</td>
                            <td>123-4567</td>
                            <td>password</td>
                            <td>100</td>
                            <td>FALSE</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- User List End -->
    </main>
    <!-- Main End -->
</body>

</html>