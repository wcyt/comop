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
    <link href="https://cdn.jsdelivr.net/npm/daisyui@1.16.2/dist/full.css" rel="stylesheet" type="text/css" />
    <!-- tailwind css -->
    <title>登録情報</title>
</head>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const password = document.getElementById('password').innerHTML = '*'.repeat(10);
    }, false);
</script>
<body>
	<%@include file="Header.jsp" %>
    <!-- Main -->
    <main id="main" class="grid grid-cols-12 py-16 bg-white sm:px-4 lg:px-32">
        <!-- Breadcrumbs -->
        <nav class="col-span-12 text-lg font-light breadcrumbs">
            <ul>
                <li><a href="top">ホーム</a></li>
                <li>登録情報</li>
            </ul>
        </nav>
        <!-- Breadcrumbs End -->
        <div class="col-span-12">
            <div class="flex flex-row mt-5 text-4xl">
                <i class="mr-4 text-blue-300 bi bi-pencil"></i>
                <h1>${user.name}様の登録情報</h1>
            </div>
            <p class="text-xl text-red-500 my-8">${message}</p>
        </div>
        <aside class="col-span-2">
            <!-- Member Registration Information -->
            <div class="flex flex-col gap-3 pb-5 border-b-2">
                <h2 class="text-2xl">会員登録情報</h2>
                <a href="">会員登録情報</a>
                <a href="">お届け先の追加・変更</a>
                <a href="">クレジットカード情報</a>
            </div>
            <!-- Member Registration Information End -->
            <!-- Point -->
            <div class="flex flex-col gap-3 py-5 border-b-2">
                <h2 class="text-2xl">ポイント</h2>
                <a href="">ポイント</a>
            </div>
            <!-- Point End -->
            <!-- Withdrawal -->
            <div class="flex flex-col gap-3 py-5 border-b-2">
                <h2 class="text-2xl">退会</h2>
                <a href="">退会手続き</a>
            </div>
            <!-- Withdrawal End -->
        </aside>
        <article class="col-span-10 ml-14">
            <!-- Member Registration Information -->
            <div class="flex flex-col p-10 bg-gray-200 border border-2 border-gray-300 rounded-lg">
                <h2 class="pb-4 text-2xl border-b-2">会員登録情報</h2>
                <!-- Basic Information -->
                <div class="grid grid-cols-12 items-center py-5 border-t border-b border-gray-400">
                    <p class="col-span-3 text-lg text-gray-500 lg:col-span-3">基本情報</p>
                    <div class="col-span-7 gap-3 lg:col-span-6">
                        <p>${user.name}</p>
                        <p>${user.address}</p>
                        <p>${user.postal_code}</p>
                    </div>
                    <div class="col-span-2 lg:col-span-3">
                        <a href="modifyBasicInfo" class="px-3 py-1 hover:bg-white text-blue-500 border border-blue-500 rounded-sm">変更</a>
                    </div>
                </div>
                <!-- Basic Information End -->
                <!-- Password -->
                <div class="grid grid-cols-12 items-center py-5 border-b border-gray-400">
                    <p class="col-span-3 text-lg text-gray-500 lg:col-span-3">パスワード</p>
                    <div class="col-span-7 gap-3 lg:col-span-6">
                        <p id="password" class="text-2xl">${user.password}</p>
                    </div>
                    <div class="col-span-2 lg:col-span-3">
                        <a href="modifyPassword" class="px-3 py-1 hover:bg-white text-blue-500 border border-blue-500 rounded-sm">変更</a>
                    </div>
                </div>
            </div>
            <!-- Member Registration Information End -->
            <!-- Change credit card information -->
            <div class="flex flex-col p-10 mt-8 bg-gray-200 border border-2 border-gray-300 rounded-lg">
                <h2 class="pb-4 text-2xl border-b-2">クレジットカード情報の変更</h2>
                <div class="grid grid-cols-12 py-5 border-t border-b border-gray-400">
                    <div class="col-span-12 text-gray-400">
                        <p>クレジットカード登録はありません</p>
                        <p class="mt-4">※新規カードの登録は、商品購入時に可能です。</p>
                    </div>
                </div>
            </div>
            <!-- Change credit card information End -->
    </main>
    <!-- Main End -->
	<%@include file="Footer.jsp" %>
</body>

</html>