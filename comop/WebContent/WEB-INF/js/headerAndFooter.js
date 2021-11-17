// Headerを呼び出す関数
window.addEventListener("load", function () {
	const header = `
            <!-- Header -->
            <header class="fixed z-50 flex flex-col items-center justify-between w-full px-4 bg-gray-100 lg:flex-row md:px-32">
                <!-- SiteName And Search Input -->
                <div class="flex flex-row sm:my-1">
                    <!-- SiteName -->
                    <p class="inline mt-2 mb-3 font-bold text-center">サイト名予定地</p>
                    <!-- SiteName End -->
                    <!-- Search Input -->
                    <div class="flex flex-row ml-10 bg-white rounded-lg">
                        <button class="focus:outline-none focus:ring-white"><i class="ml-5 mr-3 bi bi-search"></i></button>
                        <input class="border-none outline-none w-96 rounded-2xl focus:outline-none focus:ring-white" type="search" placeholder="すべてのアイテムから探す">
                    </div>
                    <!-- Search Input End -->
                </div>
                <!-- Site Name And Search Input End-->
                <!-- Menu -->
                <div class="flex flex-row">
                    <a class="px-5 py-3 font-medium transition text-md duration-400 hover:bg-gray-300 hover:text-black">ログイン</a>
                    <!-- ログインしてない時はベル・ハート・カートを消す -->
                    <a class="px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-bell"></i></a>
                    <a class="px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-suit-heart"></i></a>
                    <a class="px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-cart"></i></a>
                    <!-- ログインしてない時はベル・ハート・カートを消す -->
                    <a class="px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-list"></i></a>
                </div>
                <!-- Menu End -->
            </header>
            <!-- Header End -->
            `;
	const main = document.getElementById("main").insertAdjacentHTML("beforebegin", header);
});
// Footerを呼び出す関数
window.addEventListener("load", function () {
	const footer = `
            <!-- Footer -->
            <footer class="bottom-0 py-1 bg-gray-200 lg:px-32 sm:px-4">
                <div class="flex flex-row md:my-10 sm:my-5">
                    <ul class="md:pr-8 sm:pr-0">
                        <li>ZOZOTOWN</li>
                        <li>ZOZOSHOES</li>
                        <li>ZOZOCOSME</li>
                        <li>ZOZOGOLF</li>
                        <li>ZOZOUSED</li>
                        <li>ZOZOVILLA</li>
                        <li>YOUR BRAND PROJECT</li>
                        <li>WEAR</li>
                    </ul>
                    <ul class="border-l border-gray-300 md:pl-8 sm:pl-4">
                        <li>カテゴリー一覧</li>
                        <li>ブランド一覧</li>
                        <li>公式ショップ一覧</li>
                        <li>ランキング一覧</li>
                        <li>こだわり検索</li>
                    </ul>
                    <ul class="md:px-8 sm:px-4">
                        <li>コーディネート一覧</li>
                        <li>ショップニュース一覧</li>
                        <li>ファッションまとめ一覧</li>
                    </ul>
                    <ul class="border-l border-gray-300 md:px-8 sm:px-4">
                        <li>ZOZOGLASS</li>
                        <li>ZOZOMAT</li>
                        <li>ZOZOCARD</li>
                        <li>マルチサイズ</li>
                        <li>ギフトラッピング</li>
                        <li>いつでも買い替え割</li>
                        <li>メールマガジン購読</li>
                    </ul>
                    <ul class="border-r border-gray-300 md:pr-8 sm:pr-4">
                        <li>ヘルプ</li>
                        <li>はじめての方へ</li>
                        <li>サイトマップ</li>
                    </ul>
                    <ul class="md:px-8 sm:px-4">
                        <li>iPhoneアプリ</li>
                        <li>Androidアプリ</li>
                        <li>Twitter</li>
                        <li>Facebook</li>
                        <li>Instagram</li>
                    </ul>
                </div>
            </footer>
            <!-- Footer End -->
        `;
	const main = document.getElementById("main").insertAdjacentHTML("afterend", footer);
});
