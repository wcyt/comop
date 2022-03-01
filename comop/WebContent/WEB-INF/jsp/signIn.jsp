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
    <link href="https://cdn.jsdelivr.net/npm/daisyui@2.2.0/dist/full.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/basscss@latest/css/basscss.min.css" rel="stylesheet" type="text/css" />
    <!-- tailwind css -->
    <title>ログイン - comop</title>
</head>

<body class="flex flex-col h-screen">
	<%@include file="Header.jsp" %>
    <!-- Main -->
    <main id="main" class="grid grid-cols-12 pt-16 mb-8 lg:px-32 sm:px-4">
        <!-- Breadcrumbs -->
        <nav class="col-span-12 text-lg font-light breadcrumbs">
            <ul>
                <li><a href="top">ホーム</a></li>
                <li>ログイン</li>
            </ul>
        </nav>
        <!-- Breadcrumbs End -->
        <!-- Login Text -->
        <h1 class="col-span-12 text-3xl font-bold">ログイン</h1>
        <!-- Login Text End -->
        <!-- Login Form -->
        <form method="post" action="login" class="container col-span-12 px-12 py-8 mx-auto mt-4 bg-gray-200 w-96 form-control rounded-3xl">
            <p class="py-2 text-2xl font-bold text-center">ログイン</p>
            <p class="text-red-500 my-2">${message}</p>
            <input type="email" id="mailAddress" name="mailAddress"placeholder="メールアドレス" class="mt-5 font-bold placeholder-gray-400 border-none rounded-lg input focus:outline-blue-400" pattern=".+\.[a-zA-Z0-9][a-zA-Z0-9-]{0,61}[a-zA-Z0-9]" title="メールアドレスは、aaa@example.com のような形式で記入してください。" required>
            <input type="password" id="password" name="password"placeholder="パスワード" class="mt-5 font-bold placeholder-gray-400 border-none rounded-lg input focus:outline-blue-400" required>
            <div class="flex flex-row mt-4">
                <input type="checkbox" id="checkbox" onclick="changeInputType()" class="checkbox checkbox-primary accent-blue-400 text-white rounded-md h-5 w-5 mt-[0.4rem] mr-2">
            	<span class="mt-1">パスワードを表示する</span>
            </div>
            <button id="loginButton" class="py-3 mt-6 text-xl font-bold text-white bg-blue-400 rounded-full focus:outline-none">ログインする</button>
            <a href="signUp" class="mt-4 text-sm font-bold text-center text-blue-400 hover:underline">はじめてご利用の方（新規会員登録）</a>
        </form>
        <!-- Login Form End -->
    </main>
    <!-- Main End -->
    <%@include file="Footer.jsp" %>
</body>

<script>
	// checkboxをクリックしたらinputのtypeを変更する関数
	function changeInputType() {
	    const password = document.getElementById('password');
	    const checkbox = document.getElementById('checkbox');
	    if (checkbox.checked) password.type = 'text';
	    else password.type = 'password';
	}
</script>

</html>