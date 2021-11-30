<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="https://cdn.jsdelivr.net/npm/daisyui@1.16.1/dist/full.css" rel="stylesheet" type="text/css" />
    <!-- alpine.js tailwind css -->
    <title>Document</title>
</head>


<body>
	<%@include file="Header.jsp" %>
    <!-- Main -->
    <main id="main" class="grid grid-cols-12 py-16 bg-gray-100 sm:px-4 lg:px-32">
        <!-- Search List -->
        <aside class="col-span-3 lg:col-span-2">
            <ul class="">
                <p class="mb-4 text-xl font-bold">探す</p>
                <li class="my-3 font-normal">ブランドから探す</li>
                <li class="my-3 font-normal">公式ショップから探す</li>
                <li class="my-3 font-normal">ランキングから探す</li>
                <li class="my-3 font-normal">セール対象から探す</li>
                <li class="my-3 font-normal">クーポン対象から探す</li>
                <li class="my-3 font-normal">古着から探す</li>
                <li class="my-3 font-normal">コーディネートから探す</li>
                <li class="my-3 font-normal">こだわり条件から探す</li>
            </ul>
            <ul class="pt-6">
                <p class="my-4 text-xl font-bold">カテゴリから探す</p>
                <li class="my-3 font-normal">ブランドから探す</li>
                <li class="my-3 font-normal">公式ショップから探す</li>
                <li class="my-3 font-normal">ランキングから探す</li>
                <li class="my-3 font-normal">セール対象から探す</li>
                <li class="my-3 font-normal">クーポン対象から探す</li>
                <li class="my-3 font-normal">古着から探す</li>
                <li class="my-3 font-normal">コーディネートから探す</li>
                <li class="my-3 font-normal">こだわり条件から探す</li>
            </ul>
            <ul class="flex flex-col pt-6">
                <p class="my-4 text-2xl font-bold">お気に入り</p>
                <div class="z-10 px-4 py-3 dropdown dropdown-right dropdown-hover hover:bg-gray-200">
                    <p tabindex="0" class="font-normal">Item 0</p>
                    <ul tabindex="0" class="bg-white shadow menu dropdown-content w-52">
                        <li><a>Item 0</a></li>
                        <li><a>Item 0</a></li>
                        <li><a>Item 0</a></li>
                    </ul>
                </div>
                <div class="z-10 px-4 py-3 dropdown dropdown-right dropdown-hover hover:bg-gray-200">
                    <p tabindex="1" class="font-normal">Item 1</p>
                    <ul tabindex="1" class="bg-white shadow menu dropdown-content w-52">
                        <li><a>Item 1</a></li>
                        <li><a>Item 1</a></li>
                        <li><a>Item 1</a></li>
                    </ul>
                </div>
            </ul>
        </aside>
        <!-- Search List End -->
        <!-- Article -->
        <article class="col-span-9 lg:col-span-10">
            <!-- checked Item -->
            <section>
                <p class="text-2xl font-bold">チェックしたアイテム</p>
                <ul class="flex w-full mt-5 overflow-visible overflow-x-auto">
                    <li class="flex flex-col w-52">
                        <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                        <div class="p-4 bg-white">
                            <p class="mb-1 font-bold text-md">NIKE</p>
                            <p class="mb-2 font-light">スニーカー</p>
                            <p class="text-xl font-bold">\11,000</p>
                        </div>
                    </li>
                    <li class="flex flex-col w-52">
                        <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                        <div class="p-4 bg-white">
                            <p class="mb-1 font-bold text-md">NIKE</p>
                            <p class="mb-2 font-light">スニーカー</p>
                            <p class="text-xl font-bold">\11,000</p>
                        </div>
                    </li>
                </ul>
            </section>
            <!-- checked Item End -->
            <!-- Generation Item Ranking -->
            <section class="mt-10">
                <p class="pt-6 text-2xl font-bold">世代別アイテムランキング</p>
                <ul class="flex w-full mt-5 overflow-visible overflow-x-auto">
                    <li class="">
                        <div class="flex flex-col w-52">
                            <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                            <div class="p-4 bg-white">
                                <p class="mb-1 font-bold text-md">NIKE</p>
                                <p class="mb-2 font-light">スニーカー</p>
                                <p class="text-xl font-bold">\11,000</p>
                            </div>
                        </div>
                    </li>
                    <li class="">
                        <div class="flex flex-col w-52">
                            <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                            <div class="p-4 bg-white">
                                <p class="mb-1 font-bold text-md">NIKE</p>
                                <p class="mb-2 font-light">スニーカー</p>
                                <p class="text-xl font-bold">\11,000</p>
                            </div>
                        </div>
                    </li>
                    <li class="">
                        <div class="flex flex-col w-52">
                            <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                            <div class="p-4 bg-white">
                                <p class="mb-1 font-bold text-md">NIKE</p>
                                <p class="mb-2 font-light">スニーカー</p>
                                <p class="text-xl font-bold">\11,000</p>
                            </div>
                        </div>
                    </li>
                    <li class="">
                        <div class="flex flex-col w-52">
                            <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                            <div class="p-4 bg-white">
                                <p class="mb-1 font-bold text-md">NIKE</p>
                                <p class="mb-2 font-light">スニーカー</p>
                                <p class="text-xl font-bold">\11,000</p>
                            </div>
                        </div>
                    </li>
                    <li class="">
                        <div class="flex flex-col w-52">
                            <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                            <div class="p-4 bg-white">
                                <p class="mb-1 font-bold text-md">NIKE</p>
                                <p class="mb-2 font-light">スニーカー</p>
                                <p class="text-xl font-bold">\11,000</p>
                            </div>
                        </div>
                    </li>
                </ul>
            </section>
            <!-- Generation Item Ranking End -->
            <!-- Multi Size Item -->
            <section class="mt-10">
                <p class="pt-6 text-2xl font-bold">マルチサイズアイテム</p>
                <ul class="flex w-full mt-5 overflow-visible overflow-x-auto">
                    <li class="">
                        <div class="flex flex-col w-52">
                            <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                            <div class="p-4 bg-white">
                                <p class="mb-1 font-bold text-md">NIKE</p>
                                <p class="mb-2 font-light">スニーカー</p>
                                <p class="text-xl font-bold">\11,000</p>
                            </div>
                        </div>
                    </li>
                    <li class="">
                        <div class="flex flex-col w-52">
                            <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                            <div class="p-4 bg-white">
                                <p class="mb-1 font-bold text-md">NIKE</p>
                                <p class="mb-2 font-light">スニーカー</p>
                                <p class="text-xl font-bold">\11,000</p>
                            </div>
                        </div>
                    </li>
                    <li class="">
                        <div class="flex flex-col w-52">
                            <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                            <div class="p-4 bg-white">
                                <p class="mb-1 font-bold text-md">NIKE</p>
                                <p class="mb-2 font-light">スニーカー</p>
                                <p class="text-xl font-bold">\11,000</p>
                            </div>
                        </div>
                    </li>
                    <li class="">
                        <div class="flex flex-col w-52">
                            <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                            <div class="p-4 bg-white">
                                <p class="mb-1 font-bold text-md">NIKE</p>
                                <p class="mb-2 font-light">スニーカー</p>
                                <p class="text-xl font-bold">\11,000</p>
                            </div>
                        </div>
                    </li>
                    <li class="">
                        <div class="flex flex-col w-52">
                            <img class="" src="https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="">
                            <div class="p-4 bg-white">
                                <p class="mb-1 font-bold text-md">NIKE</p>
                                <p class="mb-2 font-light">スニーカー</p>
                                <p class="text-xl font-bold">\11,000</p>
                            </div>
                        </div>
                    </li>
                </ul>
            </section>
            <!-- Multi Size Item End -->
        </article>
        <!-- Article End -->
    </main>
    <!-- Main End -->
    <%@include file="Footer.jsp" %>
</body>

</html>