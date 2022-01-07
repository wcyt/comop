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
    <title>基本情報の変更</title>
</head>

<body>
	<%@include file="Header.jsp" %>
    <!-- Main -->
    <main id="main" class="grid grid-cols-12 py-16 bg-white sm:px-4 lg:px-32">
        <!-- Breadcrumbs -->
        <nav class="col-span-12 text-lg font-light breadcrumbs">
            <ul>
                <li><a>Home</a></li>
                <li>登録情報</li>
            </ul>
        </nav>
        <!-- Breadcrumbs End -->
        <div class="col-span-12">
            <div class="flex flex-row pb-8 mt-5 text-4xl">
                <i class="mr-4 text-blue-300 bi bi-pencil"></i>
                <h1 class="">ユーザー名様の登録情報</h1>
            </div>
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
            <form method="" action="" id="memberRegistInfo" class="flex flex-col p-10 bg-gray-200 border border-2 border-gray-300 rounded-lg">
                <h2 class="pb-4 text-2xl border-b border-gray-400">基本情報の変更</h2>
                <!-- Name -->
                <div class="grid grid-cols-12 py-5 border-t border-b border-gray-400">
                    <div class="flex flex-row items-center col-span-4 lg:col-span-3">
                        <span class="text-lg">お名前</span>
                        <span class="ml-4 font-bold text-red-600">必須</span>
                    </div>
                    <div class="flex flex-row col-span-8 gap-5 lg:col-span-9">
                        <input type="text" name="firstName" id="firstName" placeholder="例）上尾" class="w-1/2">
                        <input type="text" name="lastName" id="lastName" placeholder="太郎" class="w-1/2">
                    </div>
                </div>
                <!-- Name End -->
                <!-- Name(kana) -->
                <div class="grid grid-cols-12 py-5 border-b border-gray-400">
                    <div class="flex flex-row items-center col-span-4 lg:col-span-3">
                        <div class="flex flex-col lg:flex-row">
                            <span class="text-lg">お名前</span>
                            <span class="text-lg">（カナ）</span>
                        </div>
                        <span class="ml-4 font-bold text-red-600">必須</span>
                    </div>
                    <div class="flex flex-row col-span-8 gap-5 lg:col-span-9">
                        <input type="text" name="firstNameKana" id="firstNameKana" placeholder="例）アゲオ" class="w-1/2">
                        <input type="text" name="lastNameKana" id="lastNameKana" placeholder="タロウ" class="w-1/2">
                    </div>
                </div>
                <!-- Name(kana) End -->
                <!-- Postal Code -->
                <div class="grid grid-cols-12 py-5 border-b border-gray-400">
                    <div class="flex flex-row items-center col-span-4 lg:col-span-3">
                        <span class="text-lg">郵便番号</span>
                        <span class="ml-4 font-bold text-red-600">必須</span>
                    </div>
                    <div class="flex flex-row items-center col-span-8 gap-5 lg:col-span-9">
                        <input type="text" name="postalCode" id="postalCode" autocomplete="postal-code" placeholder="100-0002" class="w-1/2">
                        <a href="https://www.post.japanpost.jp/zipcode/index.html" class="text-blue-400 hover:underline">郵便番号を調べる<i class="ml-3 bi bi-box-arrow-up-right"></i></a>
                    </div>
                </div>
                <!-- Postal Code End -->
                <!-- Address -->
                <div class="grid grid-cols-12 py-5 border-b border-gray-400">
                    <div class="flex flex-row items-center col-span-4 lg:col-span-3">
                        <span class="text-lg">住所1</span>
                        <span class="ml-4 font-bold text-red-600">必須</span>
                    </div>
                    <div class="flex flex-row items-center col-span-8 gap-5 lg:col-span-9">
                        <input type="text" name="address" id="address" placeholder="東京都千代田区千代田" autocomplete="address" class="w-full lg:w-1/2">
                    </div>
                </div>
                <!-- Address End -->
                <!-- Modal -->
                <input type="checkbox" id="my-modal-2" class="modal-toggle">
                <div class="modal">
                    <div class="modal-box">
                        <!-- Modal Contents -->
                        <div id="inputValues"></div>
                        <div class="modal-action">
                            <label for="my-modal-2">
                                <button type="submit" class="btn btn-primary">送信</button>
                            </label>
                            <label for="my-modal-2" class="btn" onclick="deleteBasicInfo()">キャンセル</label>
                        </div>
                        <!-- Modal Contents -->
                    </div>
                </div>
                <!-- Modal End -->
                <!-- Check Button -->
                <div class="flex justify-center mt-10">
                    <label for="my-modal-2" class="px-20 py-3 text-xl font-bold text-white bg-blue-400 rounded-md " onclick="checkBasicInfo()">確認する</label>
                </div>
                <!-- Check Button End -->
            </form>
            <!-- Member Registration Information End -->
    </main>
    <!-- Main End -->
	<%@include file="Footer.jsp" %>
</body>
<script>
    function checkBasicInfo() {
        const firstName = document.getElementById('firstName').value;
        const lastName = document.getElementById('lastName').value;
        const firstNameKana = document.getElementById('firstNameKana').value;
        const lastNameKana = document.getElementById('lastNameKana').value;
        const postalCode = document.getElementById('postalCode').value;
        const address = document.getElementById('address').value;
        const output =
            `
            <div id="inputLists" class="text-lg">
                <p class="mb-4 text-2xl font-bold">変更内容の確認</p>
                <p class="my-2">お名前：${firstName} ${lastName}</p>
                <p class="my-2">お名前（カナ）：${firstNameKana} ${lastNameKana}</p>
                <p class="my-2">郵便番号：${postalCode}</p>
                <p class="my-2">住所：${address}</p>
            </div>
        `;
        document.getElementById('inputValues').insertAdjacentHTML('beforeend', output);
    }

    function deleteBasicInfo() {
        const inputLists = document.getElementById('inputLists');
        inputLists.remove();
        console.log(inputLists);
    }

    document.getElementById("registMemberInfo").onkeypress = (e) => {
        // form1に入力されたキーを取得
        const key = e.keyCode || e.charCode || 0;
        // 13はEnterキーのキーコード
        if (key == 13) {
            // アクションを行わない
            e.preventDefault();
        }
    }
</script>

</html>