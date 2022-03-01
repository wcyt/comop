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
    <!--tailwind css -->
    <link href="https://cdn.jsdelivr.net/npm/daisyui@2.0.9/dist/full.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- tailwind css -->
    <title>基本情報の変更</title>
</head>

<body class="flex flex-col h-screen">
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
            <div class="col-span-12 flex flex-row pb-8 mt-5 text-4xl">
                <i class="mr-4 text-blue-300 bi bi-pencil"></i>
                <h1 class="">ユーザー名様の登録情報</h1>
            </div>
            <aside class="col-span-2">
                <!-- Member Registration Information -->
                <div class="flex flex-col gap-3 pb-5 border-b-2">
                    <h2 class="text-2xl">会員登録情報</h2>
                    <a href="getUserInfo?mail=${user.mail}">会員登録情報</a>
                </div>
                <!-- Member Registration Information End -->
                <!-- Point -->
                <div class="flex flex-col gap-3 py-5 border-b-2">
                    <h2 class="text-2xl">ポイント</h2>
                    <a href="getPointOrderList?user_id=${user.user_id}">ポイント</a>
                </div>
                <!-- Point End -->
                <!-- Withdrawal -->
                <div class="flex flex-col gap-3 py-5 border-b-2">
                    <h2 class="text-2xl">退会</h2>
                    <a href="leave">退会手続き</a>
                </div>
                <!-- Withdrawal End -->
            </aside>
            <article class="col-span-10 ml-14">
                <!-- Member Registration Information -->
                <form method="post" action="changePassword" id="registMemberInfo" class="flex flex-col p-10 bg-gray-200  border-2 border-gray-300 rounded-lg">
                    <h2 class="pb-4 text-2xl border-b border-gray-400">パスワードの変更</h2>
                    <input type="hidden" name="user_id" value="${user.user_id}">
                    <!-- Now Password -->
                    <div class="grid grid-cols-12 py-5 border-b border-gray-400">
                        <div class="flex flex-row items-center col-span-5 lg:col-span-4">
                            <span class="text-lg">現在のパスワード</span> <span class="ml-4 font-bold text-red-600">必須</span>
                        </div>
                        <div class="flex flex-row col-span-7 gap-5 lg:col-span-8">
                            <input type="password" name="nowPassword" id="nowPassword" class="w-full lg:w-1/2 focus:outline-blue-500">
                        </div>
                        <div class="flex flex-row items-center col-span-5 lg:col-span-4"></div>
                        <div class="flex flex-row col-span-7 gap-5 lg:col-span-8">
                            <div class="flex flex-row mt-4">
                                <input type="checkbox" id="nowPasswordCheckbox" onclick="changeNowPasswordInputType()" class="checkbox accent-blue-400 text-white rounded-md h-5 w-5 mt-[0.4rem] mr-2">
                                <span class="mt-1">パスワードを表示する</span>
                            </div>
                        </div>
                    </div>
                    <!-- Now Password End -->
                    <!-- New Password-->
                    <div class="grid grid-cols-12 py-5 border-b border-gray-400">
                        <div class="flex flex-row items-center col-span-5 lg:col-span-4">
                            <span class="text-lg">新しいパスワード</span> <span class="ml-4 font-bold text-red-600">必須</span>
                        </div>
                        <div class="flex flex-row col-span-7 gap-5 lg:col-span-8">
                            <input type="password" name="newPassword" id="newPassword" class="w-full lg:w-1/2 focus:outline-blue-500">
                        </div>
                        <div class="flex flex-row items-center col-span-5 lg:col-span-4"></div>
                        <div class="flex flex-row col-span-7 gap-5 lg:col-span-8">
                            <div class="flex flex-row mt-4">
                                <input type="checkbox" id="newPasswordCheckbox" onclick="changeNewPasswordInputType()" class="checkbox accent-blue-400 text-white rounded-md h-5 w-5 mt-[0.4rem] mr-2">
                                <span class="mt-1">パスワードを表示する</span>
                            </div>
                        </div>
                    </div>
                    <!-- New Password End -->
                    <!-- Modal -->
                    <!-- Check Button -->
                    <div class="flex justify-center mt-10">
                        <button type="submit" class="px-20 py-3 text-xl font-bold text-white bg-blue-400 rounded-md ">変更する</button>
                    </div>
                    <!-- Check Button End -->
                </form>
                <!-- Member Registration Information End -->
            </article>
        </main>
        <!-- Main End -->
        <%@include file="Footer.jsp" %>
</body>

<script>
    // checkboxをクリックしたらinputのtypeを変更する関数
    function changeNowPasswordInputType() {
        const nowPassword = document.getElementById('nowPassword');
        const nowPasswordCheckbox = document.getElementById('nowPasswordCheckbox');
        nowPasswordCheckbox.checked ? nowPassword.type = 'text' : nowPassword.type = 'password';
    }

    function changeNewPasswordInputType() {
        const newPassword = document.getElementById('newPassword');
        const newPasswordCheckbox = document.getElementById('newPasswordCheckbox');
        newPasswordCheckbox.checked ? newPassword.type = 'text' : newPassword.type = 'password';
    }
</script>

</html>