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
            <div class="text-gray-800" x-data="{ selected: 'option-1' }">
                <nav class="flex gap-4">
                    <a href="#option-1" class="px-8 py-3 border-t-2 border-l-2 border-r-2 rounded-t-md" x-bind:class="{ 'bg-gray-100': selected === 'option-1' }" x-on:click="selected = 'option-1'">発送前商品</a>
                    <a href="#option-2" class="px-8 py-3 border-t-2 border-l-2 border-r-2 rounded-t-md" x-bind:class="{ 'bg-gray-100': selected === 'option-2' }" x-on:click="selected = 'option-2'">発送済み商品</a>
                </nav>
                <div x-show="selected === 'option-1'" class="p-4 bg-gray-100 border-2 rounded-b-md">
                    <div class="text-center">
                        <p class="my-10 text-xl">発送前商品はありません。</p>
                        <div class="my-10">
                            <p>注文履歴への反映には、お時間がかかる場合があります。</p>
                            <p>ログインせずにご注文いただいた場合、こちらの注文履歴には反映されません。</p>
                            <p>配信される「注文確定メール」より、内容をご確認ください。</p>
                        </div>
                    </div>
                </div>
                <div x-show="selected === 'option-2'" class="px-6 bg-gray-100 border-2">
                    <p class="my-8">お客様の注文一覧と、発送済み商品の確認が可能です。</p>
                    <div class="my-4 font-bold text-md">
                        <span>件数</span>
                        <span>0</span>
                        <span>件</span>
                    </div>
                    <p class="my-10 text-xl text-center">発送済み商品はありません</p>
                </div>
            </div>
        </article>
    </main>
    <!-- Main End -->
    <%@include file="Footer.jsp" %>
</body>

</html>