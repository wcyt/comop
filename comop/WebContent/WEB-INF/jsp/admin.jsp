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
    <title>管理ページ</title>
</head>

<body>
    <!-- Main -->
    <main id="main" class="grid grid-cols-12 gap-6 py-16 bg-white sm:px-4 lg:px-32">
        <div class="flex flex-col items-center col-span-12 gap-3">
            <h1 class="text-2xl font-bold text-center">管理ページ</h1>
            <a href="logout" class="max-w-lg px-32 py-2 text-center text-white bg-blue-400 rounded-full">トップページへ</a>
        </div>
        <!-- Product Management -->
        <div class="col-span-6">
            <div class="flex flex-col gap-2 px-4 font-normal text-center border-2 border-gray-300 rounded-xl">
                <p class="py-3 text-xl border-b-2 border-gray-300">商品管理</p>
                <div class="flex flex-col gap-4 my-4 text-lg">
                    <a href="getAdminProductsList" class="w-full py-2 bg-gray-300 rounded-full">商品一覧・登録</a>
                </div>
            </div>
        </div>
        <!-- Product Management End -->
        <!-- Point Product Management -->
        <div class="col-span-6">
            <div class="flex flex-col gap-2 px-4 font-normal text-center border-2 border-gray-300 rounded-xl">
                <p class="py-3 text-xl border-b-2 border-gray-300">ポイント商品管理</p>
                <div class="flex flex-col gap-4 my-4 text-lg">
                    <a href="getAdminRewardProductsList" class="w-full py-2 bg-gray-300 rounded-full">ポイント商品一覧・登録</a>
                </div>
            </div>
        </div>
        <!-- Point Product Management End -->
        <!-- Color Management -->
        <div class="col-span-6">
            <div class="flex flex-col gap-2 px-4 font-normal text-center border-2 border-gray-300 rounded-xl">
                <p class="py-3 text-xl border-b-2 border-gray-300">カラー管理</p>
                <div class="flex flex-col gap-4 my-4 text-lg">
                    <a href="getAdminColorList" class="w-full py-2 bg-gray-300 rounded-full">カラー一覧・登録</a>
                </div>
            </div>
        </div>
        <!-- Color Management End -->
        <!-- User Management -->
        <div class="col-span-6">
            <div class="flex flex-col gap-2 px-4 font-normal text-center border-2 border-gray-300 rounded-xl">
                <p class="py-3 text-xl border-b-2 border-gray-300">ユーザー管理</p>
                <div class="flex flex-col gap-4 my-4 text-lg">
                    <a href="getAdminUserList" class="w-full py-2 bg-gray-300 rounded-full">ユーザー一覧・登録</a>
                </div>
            </div>
        </div>
        <!-- User Management End -->
    </main>
    <!-- Main End -->
</body>

</html>