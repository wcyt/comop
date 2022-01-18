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
    <title>新規会員登録</title>
</head>

<body>
	<%@include file="Header.jsp" %>
    <!-- Main -->
    <main class="grid grid-cols-12 mt-16 mb-8 lg:px-32 sm:px-4">
        <!-- Breadcrumbs -->
        <nav class="col-span-12 text-lg font-light breadcrumbs ">
            <ul>
                <li><a href="top">Home</a></li>
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
    <%@include file="Footer.jsp" %>
</body>

</html>