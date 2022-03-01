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
    <link href="https://cdn.jsdelivr.net/npm/basscss@latest/css/basscss.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.jsdelivr.net/npm/daisyui@1.16.2/dist/full.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.jsdelivr.net/npm/daisyui@1.25.4/dist/full.css" rel="stylesheet" type="text/css" />
  	<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2/dist/tailwind.min.css" rel="stylesheet" type="text/css" />
    <!-- tailwind css -->
    <title>新規会員登録 - comop</title>
</head>

<body class="flex flex-col h-screen">
	<%@include file="Header.jsp" %>
    <!-- Main -->
    <main class="grid grid-cols-12 mt-16 mb-8 lg:px-32 sm:px-4">
        <!-- Breadcrumbs -->
        <nav class="col-span-12 text-lg font-light breadcrumbs ">
            <ul>
                <li><a href="top">ホーム</a></li>
                <li>新規会員登録</li>
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
                    <input type="text" name="name" id="" class="w-full px-3 py-2 focus:outline-blue-400" maxlength="20" required>
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
                    <input type="email" name="mail" class="w-full px-3 py-2 focus:outline-blue-400" pattern=".+\.[a-zA-Z0-9][a-zA-Z0-9-]{0,61}[a-zA-Z0-9]" title="メールアドレスは、aaa@example.com のような形式で記入してください。" required>
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
                    <input type="password" name="password" id="password" class="w-full px-3 py-2 focus:outline-blue-400" required>
				</div>
				<div class="flex flex-row items-center col-span-5 lg:col-span-4">
                </div>
                <div class="flex flex-row col-span-7 gap-5 lg:col-span-8">
					<div class="flex flex-row mt-2">
						<input type="checkbox" id="checkbox" onclick="changeInputType()" class="checkbox accent-blue-400 text-white rounded-md h-5 w-5 mt-[0.4rem] mr-2">
						<span class="mt-1">パスワードを表示する</span>
					</div>
				</div>
            </div>
            <!-- Password End -->
            <!-- Submit Button -->
            <button type="submit" class="flex items-center px-20 py-2 mx-auto mt-6 text-white bg-blue-400 focus:outline-none">会員登録する</button>
            <!-- Submit Button End -->
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