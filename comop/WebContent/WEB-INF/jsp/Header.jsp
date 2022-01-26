<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<script>
function check(){
	const inputValue = document.search_form.key.value;
	if(inputValue == "" || !inputValue.match(/\S/g)){
		return false;
	}
}
</script>
<body>
	<c:choose>
		<c:when test="${user.name == null}">
			<!-- ログイン前 -->
			<header class="fixed top-0 z-50 flex flex-col items-center justify-between w-full px-4 bg-gray-100 lg:flex-row lg:px-32">
		        <!-- SiteName And Search Input -->
		        <form method="get" action="searchProducts" name="search_form" onsubmit="return check()" class="flex flex-row sm:my-1">
		            <!-- SiteName -->
		            <a href="top" class="inline mt-3 mb-3 font-bold text-center">comop</a>
		            <!-- SiteName End -->
		            <!-- Search Input -->
		            <div class="flex flex-row items-center ml-10 bg-white rounded-lg">
		                <button class="focus:outline-none focus:ring-white"><i class="ml-5 mr-3 bi bi-search"></i></button>
		                <input type="search" name="key" placeholder="すべてのアイテムから探す" class="border-none outline-none w-96 lg:w-72 rounded-lg focus:bg-white focus:outline-none focus:border-sky-500">
		            </div>
		            <!-- Search Input End -->
		        </form>
		        <!-- Site Name And Search Input End-->
		        <!-- Menu -->
		        <div class="flex flex-row">
		            <!-- User -->
		            <a href="signIn" class="flex items-center px-5 py-3 font-medium transition text-md duration-400 hover:bg-gray-300 hover:text-black">ログイン</a>
		            <!-- User End -->
		            <!-- Heart -->
		            <div class="dropdown dropdown-end dropdown-hover">
		                <a href="" tabindex="0" class="flex items-center px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-suit-heart"></i></a>
		                <div tabindex="0" class="flex justify-center px-10 py-4 -mr-32 shadow w-80 menu dropdown-content bg-base-100 rounded-box">
		                    <i class="mt-3 mb-5 text-5xl font-light text-center bi bi-suit-heart"></i>
		                    <p class="">会員でない方でも「お気に入り」が 使えるようになりました。</p>
		                </div>
		            </div>
		            <!-- Heart End -->
		            <!-- Cart -->
		            <div class="dropdown dropdown-end dropdown-hover">
		                <a href="" tabindex="1" class="flex items-center px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-cart"></i></a>
		                <div tabindex="1" class="flex justify-center px-10 py-4 -mr-32 text-center text-gray-400 shadow w-80 menu dropdown-content bg-base-100 rounded-box">
		                    <i class="mt-3 mb-5 text-5xl font-light bi bi-cart"></i>
		                    <p class="">カートに商品がありません</p>
		                </div>
		            </div>
		            <!-- Cart End -->
		            <!--  -->
		            <div class="dropdown dropdown-end dropdown-hover">
		                <a tabindex="2" class="flex items-center px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-list"></i></a>
		                <div tabindex="2" class="flex justify-center p-8 shadow w-96 menu dropdown-content bg-base-100 rounded-box">
		                    <div class="flex flex-row">
		                        <div class="flex flex-col w-full gap-2 mr-10">
		                            <h2 class="mb-4 text-xl font-bold">アイテムを探す</h2>
		                            <a href="">カテゴリーから探す</p>
		                            <a href="">ブランドから探す</p>
		                            <a href="">公式ショップから探す</p>
		                            <a href="">ランキングから探す</p>
		                            <a href="">セール対象から探す</p>
		                            <a href="">クーポン対象から探す</p>
		                            <a href="">コーディネートから探す</p>
		                            <a href="">こだわり条件から探す</p>
		                        </div>
		                        <div class="flex flex-col w-full gap-2 ">
		                            <h2 class="mb-4 text-xl font-bold">ヘルプ・その他</h2>
		                            <a href="">よくある質問</a>
		                            <a href="">はじめての方へ</a>
		                            <a href="signUp">新規会員登録</a>
		                            <a href="getRewardProductsList">ポイント商品を見る</a>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		        <!-- Menu End -->
		    </header>
			<!-- ログイン前 -->
		</c:when>
		<c:when test="${user.name != null}">
			<!-- ログイン後 -->
			<header class="fixed top-0 z-50 flex flex-col items-center justify-between w-full px-4 bg-gray-100 lg:flex-row lg:px-32">
		        <!-- SiteName And Search Input -->
		        <form method="get" action="searchProducts" name="search_form" onsubmit="return check()" class="flex flex-row sm:my-1">
		            <!-- SiteName -->
		            <a href="top" class="inline mt-3 mb-3 font-bold text-center">comop</a>
		            <!-- SiteName End -->
		            <!-- Search Input -->
		            <div class="flex flex-row ml-10 bg-white rounded-lg">
		                <button class="focus:outline-none focus:ring-white"><i class="ml-5 mr-3 bi bi-search"></i></button>
		                <input type="search" name="key" placeholder="すべてのアイテムから探す" class="border-none outline-none w-96 lg:w-72 rounded-2xl focus:outline-none focus:ring-white">
		            </div>
		            <!-- Search Input End -->
		        </form>
		        <!-- Site Name And Search Input End-->
		        <!-- Menu -->
		        <div class="flex flex-row">
		            <!-- User -->
		            <div class="dropdown dropdown-end dropdown-hover">
		                <p tabindex="0" class="flex items-center px-5 py-3 font-medium transition text-md duration-400 hover:bg-gray-300 hover:text-black">${sessionScope.user.name} 様</p>
		                <ul tabindex="0" class="w-48 p-2 shadow -mr-7 menu dropdown-content bg-base-100 rounded-box">
		                    <li class="hover:underline"><a href="getUserInfo?mail=${sessionScope.user.mail}">登録情報</a></li>
		                    <li class="hover:underline"><a href="getOrderHistory?user_id=${user.user_id}">注文履歴・発送状況</a></li>
		                    <li class="hover:underline"><a href="logout">ログアウト</a></li>
		                </ul>
		            </div>
		            <!-- User End -->
		            <!-- Heart -->
		            <div class="dropdown dropdown-end dropdown-hover">
		                <a href="getFavoriteList?user_id=${sessionScope.user.user_id}" tabindex="1" class="flex items-center px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-suit-heart"></i></a>
		                <div tabindex="1" class="flex justify-center p-8 -mr-32 shadow w-[36rem] menu dropdown-content bg-base-100 rounded-box">
		                    <a href="favorite" class="text-2xl font-bold">お気に入り</a>
		                    <div class="flex flex-row my-4 font-bold text-blue-400">
		                        <a href="" class="pr-3">アイテム一覧</a>
		                        <a href="" class="px-3 border-l-2 border-r-2">ブランド一覧</a>
		                        <a href="" class="pl-3">ショップ一覧</a>
		                    </div>
		                    <div class="flex flex-row">
		                        <div class="w-1/2 font-bold border-r-2">
		                            <p class="text-lg">ブランド</p>
		                            <i class="flex justify-center my-6 mt-3 text-xl text-5xl text-gray-400 bi bi-suit-heart"></i>
		                            <p class="text-center text-gray-400">お気に入りブランドを 見つけよう！</p>
		                        </div>
		                        <div class="w-1/2 pl-4 font-bold">
		                            <p class="text-lg">ショップ</p>
		                            <i class="flex justify-center my-6 mt-3 text-xl text-5xl text-gray-400 bi bi-suit-heart"></i>
		                            <p class="text-center text-gray-400">お気に入りショップを 見つけよう！</p>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <!-- Heart End -->
		            <!-- Cart -->
		            <div class="dropdown dropdown-end dropdown-hover">
		                <a href="getCartList?user_id=${sessionScope.user.user_id}" tabindex="2" class="flex items-center px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-cart"></i></a>
		                <div tabindex="2" class="flex justify-center px-10 py-4 -mr-32 text-center text-gray-400 shadow w-80 menu dropdown-content bg-base-100 rounded-box">
		                    <i class="mt-3 mb-5 text-5xl font-light bi bi-cart"></i>
		                    <p class="">カートに商品がありません</p>
		                </div>
		            </div>
		            <!-- Cart End -->
		            <!-- Humbuger Menu -->
		            <div class="dropdown dropdown-end dropdown-hover">
		                <a tabindex="3" class="flex items-center px-5 py-3 transition duration-400 hover:bg-gray-300 hover:text-black"><i class="text-xl bi bi-list"></i></a>
		                <div tabindex="3" class="flex justify-center p-8 shadow w-96 menu dropdown-content bg-base-100 rounded-box">
		                    <div class="flex flex-row">
		                        <div class="flex flex-col w-full gap-2 mr-10">
		                            <h2 class="mb-4 text-xl font-bold">アイテムを探す</h2>
		                            <a href="">カテゴリーから探す</p>
		                            <a href="">ブランドから探す</p>
		                            <a href="">公式ショップから探す</p>
		                            <a href="">ランキングから探す</p>
		                            <a href="">セール対象から探す</p>
		                            <a href="">クーポン対象から探す</p>
		                            <a href="">コーディネートから探す</p>
		                            <a href="">こだわり条件から探す</p>
		                        </div>
		                        <div class="flex flex-col w-full gap-2 ">
		                            <h2 class="mb-4 text-xl font-bold">ヘルプ・その他</h2>
		                            <a href="">よくある質問</a>
		                            <a href="">はじめての方へ</a>
		                            <a href="signUp">新規会員登録</a>
		                            <a href="getRewardProductsList">ポイント商品を見る</a>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <!-- Humbuger Menu End -->
		        </div>
		        <!-- Menu End -->
		    </header>
			<!-- ログイン後 -->
		</c:when>
	</c:choose>
</body>
<script>
//inputが空白か何もない場合送信させない関数
const key = document.getElementsByName("key");
key.addEventListener("keypress", checkInput(key));

function checkInput(key) {
	if (e.keyCode === 13) {
        key === "" || key === " " ? false : true;
	}
}

</script>
</html>