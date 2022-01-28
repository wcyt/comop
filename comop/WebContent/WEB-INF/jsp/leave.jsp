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
    // AWSのときに動くか怪しい
    function displayConfirm() {
        if (warning.innerHTML == "") {
            const message = confirm("【注意事項】は確認しましたか？\n 本当に退会しますか？");
            const url = location.origin + "/comop/lapseUser?user_id=${user.user_id}";
            if (message) location.href = url;
        } else {
            warning.removeChild(warning.childNodes[0]);
        }
    }

    function checkAll() {
        let checkedCount = 0;
        const checkboxes = document.getElementsByClassName('checkbox');
        const leaveButton = document.getElementById('leaveButton');
        const warning = document.getElementById('warning');
        const warningParagraph = `<p class="mt-5 text-sm text-center text-red-500">全ての項目がチェックされていないと退会手続きには進みません。再度ご確認ください。</p>`;
        for (let i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) checkedCount++;
        }
        checkedCount === 4 ? displayConfirm() : warning.innerHTML = warningParagraph;
    }
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
                <div class="flex flex-row pb-8 mt-5 text-4xl">
                    <i class="mr-4 text-blue-300 bi bi-pencil"></i>
                    <h1 class="">${user.name}様の登録情報</h1>
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
                <div class="grid grid-cols-12 p-10 bg-gray-200 border-2 border-gray-300 rounded-lg">
                    <div class="col-span-12 pb-5 border-b border-gray-300">
                        <h2 class="mb-4 text-xl">退会手続き</h2>
                        <p class="text-sm text-gray-500">下記の項目をチェックのうえ、チェックを入れお進みください。</p>
                    </div>
                    <div class="col-span-12 py-4 border-b border-gray-300">
                        <label class="flex items-center cursor-pointer">
                            <input type="checkbox" class="bg-gray-300 border-none rounded-full checkbox checkbox-sm checkbox-primary">
                            <span class="ml-4 text-lg">会員登録情報について</span>
                        </label>
                        <ul class="grid gap-2 mt-2 text-sm list-disc ml-14">
                            <li>個人情報規定ならびに弊社のセキュリティシステム上、退会後の会員登録内容の確認はできなくなります。</li>
                        </ul>
                    </div>
                    <div class="col-span-12 py-4 border-b border-gray-300">
                        <label class="flex items-center cursor-pointer">
                            <input type="checkbox" class="bg-gray-300 border-none rounded-full checkbox checkbox-sm checkbox-primary">
                            <span class="ml-4 text-lg">ポイントについて</span>
                        </label>
                        <ul class="grid gap-2 mt-2 text-sm list-disc ml-14">
                            <li>お持ちのポイントは無効となります。新しい会員登録へのポイントの移行はできません。</li>
                        </ul>
                    </div>
                    <div class="col-span-12 py-4 border-b border-gray-300">
                        <label class="flex items-center cursor-pointer">
                            <input type="checkbox" class="bg-gray-300 border-none rounded-full checkbox checkbox-sm checkbox-primary">
                            <span class="ml-4 text-lg">ご注文商品について</span>
                        </label>
                        <ul class="grid gap-2 mt-2 text-sm list-disc ml-14">
                            <li>既にご注文いただきました商品は、退会後も発送を行わせていただきます。</li>
                            <li>退会後は、商品の配送先・お支払い方法・配達日時の変更はできません。</li>
                        </ul>
                    </div>
                    <div class="col-span-12 py-4 border-b border-gray-300">
                        <label class="flex items-center cursor-pointer">
                            <input type="checkbox" class="bg-gray-300 border-none rounded-full checkbox checkbox-sm checkbox-primary">
                            <span class="ml-4 text-base">すべての項目を確認しましたか？</span>
                        </label>
                        <div id="warning"></div>
                    </div>
                    <div class="flex justify-center col-span-12 gap-3 mt-7">
                        <button onclick="location.href='getUserInfo?mail=${user.mail}'" class="px-16 py-2 font-bold border rounded-sm border-sky-500 text-sky-500">退会しない</button>
                        <button onclick="checkAll()" id="leaveButton" class="px-16 py-2 font-bold text-white rounded-sm bg-sky-500">退会する</button>
                    </div>
                </div>
            </article>
        </main>
        <!-- Main End -->
        <%@include file="Footer.jsp" %>
</body>
</html>