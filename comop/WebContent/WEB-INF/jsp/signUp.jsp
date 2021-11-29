<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
    <title>新規会員登録</title>
</head>

<body>
    <!-- Header -->
    <header class="flex grid flex-col items-center justify-between w-full grid-cols-12 px-4 bg-gray-100 lg:flex-row md:px-32">
        <!-- SiteName -->
        <div class="flex flex-col col-span-12 lg:flex-row sm:mt-1">
            <p class="inline mt-2 mb-3 font-bold text-center">サイト名予定地</p>
        </div>
        <!-- SiteName End-->
    </header>
    <!-- Header End -->
    <!-- Main -->
    <main class="grid grid-cols-12 mt-4 mb-8 lg:px-32 sm:px-4">
        <!-- Breadcrumbs -->
        <nav class="col-span-12 text-lg font-light breadcrumbs ">
            <ul>
                <li><a>Home</a></li>
                <li><a>新規会員登録</a></li>
            </ul>
        </nav>
        <!-- Breadcrumbs End -->
        <!-- New Member Registration Text -->
        <h1 class="col-span-12 my-5 text-3xl">新規会員登録</h1>
        <!-- New Member Registration Text End -->
        <!-- Login Form -->
        <form method="post" action="createAccount" class="col-span-12 px-28 py-8 mt-10 bg-gray-200 lg:mx-44">
            <!-- User Info Text -->
            <p class="py-4 text-xl">ユーザー情報</p>
            <!-- User Info Text End -->
            <!-- User Name-->
            <div class="grid grid-cols-12 py-5 border-b border-gray-400">
                <div class="flex flex-row items-center col-span-5 lg:col-span-4">
                    <span class="text-lg">ユーザー名</span>
                    <span class="ml-4 font-bold text-red-600">必須</span>
                </div>
                <div class="flex flex-row col-span-7 gap-5 lg:col-span-8">
                    <input type="text" name="name" id="" class="w-full" required>
                </div>
            </div>
            <!-- User Name-->
            <!-- Mail Address-->
            <div class="grid grid-cols-12 py-5 border-b border-gray-400">
                <div class="flex flex-row items-center col-span-5 lg:col-span-4">
                    <span class="text-lg">メールアドレス</span>
                    <span class="ml-4 font-bold text-red-600">必須</span>
                </div>
                <div class="flex flex-row col-span-7 gap-5 lg:col-span-8">
                    <input type="email" name="mail" id="" class="w-full" required>
                </div>
            </div>
            <!-- Mail Address End -->
            <!-- Password-->
            <div class="grid grid-cols-12 py-5 border-b border-gray-400">
                <div class="flex flex-row items-center col-span-5 lg:col-span-4">
                    <span class="text-lg">パスワード</span>
                    <span class="ml-4 font-bold text-red-600">必須</span>
                </div>
                <div class="flex flex-row col-span-7 gap-5 lg:col-span-8">
                    <input type="password" name="password" id="" class="w-full" required>
                </div>
            </div>
            <!-- Password End -->
            <!-- Submit Button -->
            <button type="submit" class="flex items-center px-20 py-2 mx-auto mt-4 text-white bg-blue-400">会員登録する</button>
            <!-- Submit Button End -->
        </form>
        <!-- Login Form End -->
    </main>
    <!-- Main End -->
    <!-- Footer -->
    <footer class="grid grid-cols-12 bg-gray-200 lg:px-32 sm:px-4">
        <div class="flex flex-row col-span-12 md:my-10 sm:my-5">
            <ul class="md:pr-8 sm:pr-0">
                <li>ZOZOTOWN</li>
                <li>ZOZOSHOES</li>
                <li>ZOZOCOSME</li>
                <li>ZOZOGOLF</li>
                <li>ZOZOUSED</li>
                <li>ZOZOVILLA</li>
                <li>YOUR BRAND PROJECT</li>
                <li>WEAR</li>
            </ul>
            <ul class="border-l border-gray-300 md:pl-8 sm:pl-4">
                <li>カテゴリー一覧</li>
                <li>ブランド一覧</li>
                <li>公式ショップ一覧</li>
                <li>ランキング一覧</li>
                <li>こだわり検索</li>
            </ul>
            <ul class="md:px-8 sm:px-4">
                <li>コーディネート一覧</li>
                <li>ショップニュース一覧</li>
                <li>ファッションまとめ一覧</li>
            </ul>
            <ul class="border-l border-gray-300 md:px-8 sm:px-4">
                <li>ZOZOGLASS</li>
                <li>ZOZOMAT</li>
                <li>ZOZOCARD</li>
                <li>マルチサイズ</li>
                <li>ギフトラッピング</li>
                <li>いつでも買い替え割</li>
                <li>メールマガジン購読</li>
            </ul>
            <ul class="border-r border-gray-300 md:pr-8 sm:pr-4">
                <li>ヘルプ</li>
                <li>はじめての方へ</li>
                <li>サイトマップ</li>
            </ul>
            <ul class="md:px-8 sm:px-4">
                <li>iPhoneアプリ</li>
                <li>Androidアプリ</li>
                <li>Twitter</li>
                <li>Facebook</li>
                <li>Instagram</li>
            </ul>
        </div>
    </footer>
    <!-- Footer End -->
</body>

</html>