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
    <script src="js/autokana.js" defer></script>
    <script src="https://cdn.jsdelivr.net/npm/fetch-jsonp@1.1.3/build/fetch-jsonp.min.js"></script>
    <!-- tailwind css -->
    <title>Document</title>
</head>

<body class="flex flex-col min-h-screen">
    <!-- Main -->
    <main id="main" class="grid grid-cols-12 py-16 bg-white sm:px-4 lg:px-32">
        <h1 class="col-span-12 text-2xl font-bold">COMOP</h1>
        <div class="col-span-12 lg:col-span-8">
            <div class="flex flex-row pb-8 mt-5 text-2xl border-b-2">
                <h2 class="">お届け先・配送方法・お支払い方法</h1>
            </div>
        </div>
        <!-- Breadcrumbs End -->
        <!-- Shipping address, delivery method, and payment method -->
        <div class="col-span-12 lg:col-span-8">
            <form method="post" action="addOrder" class="flex flex-col">
                <!-- Name -->
                <div class="grid grid-cols-12 py-5 border-gray-400">
                    <div class="flex flex-row items-center col-span-4 lg:col-span-3">
                        <span class="text-lg">お名前</span>
                        <span class="ml-4 font-bold text-red-600">必須</span>
                    </div>
                    <div class="flex flex-row col-span-8 gap-5 lg:col-span-9">
                        <input type="text" name="firstName" id="firstName" placeholder="例）上尾" autocomplete="given-name" class="w-1/2" value="${user.first_name}" required>
                        <input type="text" name="lastName" id="lastName" placeholder="太郎" autocomplete="family-name" class="w-1/2" value="${user.last_name}" required>
                    </div>
                </div>
                <!-- Name End -->
                <!-- Name(kana) -->
                <div class="grid grid-cols-12 py-5 border-gray-400">
                    <div class="flex flex-row items-center col-span-4 lg:col-span-3">
                        <div class="flex flex-col md:flex-row">
                            <span class="text-lg">お名前</span>
                            <span class="text-lg">（カナ）</span>
                        </div>
                        <span class="ml-3 font-bold text-red-600">必須</span>
                    </div>
                    <div class="flex flex-row col-span-8 gap-5 lg:col-span-9">
                        <input type="text" name="firstNameKana" id="firstNameKana" placeholder="例）アゲオ" autocomplete="given-name" class="w-1/2" value="${user.first_name_kana}" required>
                        <input type="text" name="lastNameKana" id="lastNameKana" placeholder="タロウ" autocomplete="family-name" class="w-1/2" value="${user.last_name_kana}" required>
                    </div>
                </div>
                <!-- Name(kana) End -->
                <!-- Postal Code -->
                <div class="grid grid-cols-12 py-5 border-gray-400">
                    <div class="flex flex-row items-center col-span-4 lg:col-span-3">
                        <span class="text-lg">郵便番号</span>
                        <span class="ml-4 font-bold text-red-600">必須</span>
                    </div>
                    <div class="flex flex-row items-center col-span-8 gap-5 lg:col-span-9">
                        <div class="flex flex-col w-1/2">
                            <input type="text" name="postalCode" id="postalCode" autocomplete="postal-code" placeholder="100-0002" class="w-full" value="${user.postal_code}" required>
                            <p id="error" class="ml-2 text-sm text-red-500"></p>
                        </div>
                        <a href="https://www.post.japanpost.jp/zipcode/index.html" class="text-blue-400 hover:underline">郵便番号を調べる<i class="ml-3 bi bi-box-arrow-up-right"></i></a>
                        <button type="button" class="px-3 py-1 text-white bg-blue-500" onclick="searchAddress()">住所検索</button>
                    </div>
                </div>
                <!-- Postal Code End -->
                <!-- Address -->
                <div class="grid grid-cols-12 py-5 border-gray-400">
                    <div class="flex flex-row items-center col-span-4 lg:col-span-3">
                        <span class="text-lg">住所1</span>
                        <span class="ml-4 font-bold text-red-600">必須</span>
                    </div>
                    <div class="flex flex-row items-center col-span-8 gap-5 lg:col-span-9">
                        <input type="text" name="address" id="address" placeholder="東京都千代田区千代田" autocomplete="address" class="w-1/2" value="${user.address}" required>
                    </div>
                </div>
                <!-- Address End -->
                <!-- Tel -->
                <div class="grid grid-cols-12 py-5 border-b border-gray-400">
                    <div class="flex flex-row items-center col-span-4 lg:col-span-3">
                        <span class="text-lg">電話番号</span>
                        <span class="ml-4 font-bold text-red-600">必須</span>
                    </div>
                    <div class="flex flex-row items-center col-span-8 gap-5 lg:col-span-9">
                        <input type="text" name="tel" id="tel" placeholder="09012345678（ハイフンなし）" autocomplete="tel" class="w-1/2" value="${user.tel}" required>
                    </div>
                </div>
                <!-- Tel End -->
                <!-- Payment Method Group -->
                <div class="grid grid-cols-12 py-10 border-b border-gray-400">
                    <div class="flex flex-row col-span-2 lg:col-span-3">
                        <span class="text-lg">お支払方法</span>
                    </div>
                    <div class="flex flex-col col-span-9 gap-5 lg:col-span-8">
                        <p class="col-span-12">クレジットカード</p>
                        <!-- Credit Number -->
                        <div class="grid items-center grid-cols-12">
                            <p class="col-span-3">クレジット番号</p>
                            <input type="text" name="creditNumber" id="creditNumber" value="${credit_number}" autocomplete="cc-number" placeholder="半角数字のみ（ハイフンなし）" autocomplete="tel" class="col-span-9 w-72" required>
                        </div>
                        <!-- Credit Number End -->
                        <!-- Security Number -->
                        <div class="grid items-center grid-cols-12">
                            <p class="col-span-3">セキュリティ番号</p>
                            <input type="text" name="securityCode" id="securityNumber" value="${security_code}" autocomplete="cc-csc" placeholder="半角数字のみ" autocomplete="tel" class="col-span-9 w-72" required>
                        </div>
                        <!-- Security Number -->
                        <!-- Card Holder -->
                        <div class="grid items-center grid-cols-12 ">
                            <p class="col-span-3">カード名義</p>
                            <input type="text" name="cardHolder" id="cardHolder" value="${card_holder}" placeholder="TARO AGEO" autocomplete="cc-name" class="col-span-9 w-72" required>
                        </div>
                        <!-- Card Holder End -->
                        <!-- Expiration Date -->
                        <div class="grid items-center grid-cols-12">
                            <p class="col-span-3">有効期限</p>
                            <select name="expirationMonth" id="expirationMonth" autocomplete="cc-exp-month" class="col-span-3 lg:col-span-2">
                                <option hidden></option>
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                            <p class="mx-4">月</p>
                            <select name="expirationYear" id="expirationYear" autocomplete="cc-exp-year" class="col-span-3 lg:col-span-2">
                                <option hidden></option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="31">31</option>
                            </select>
                            <p class="mx-4">年</p>
                        </div>
                        <!-- Expiration Date End -->
                    </div>
                    <div class="col-span-1">
                        <label class="inline-flex items-center ">
                            <span class="text-xl font-light ">\0</span>
                        </label>
                    </div>
                </div>
                <!-- Payment Method Group End -->
                <!-- Cart Lists -->
                <div class="border-b-2">
	                <c:forEach var="product" items="${data}">
			            <div class="grid grid-cols-12 justify-center flex items-center py-8">
			            	<div class="col-span-3"></div>
			            	<a href="getProductDetail?product_id=${product.product_id}" class="col-span-3">
			            		<img class="w-full h-44" src="images/${product.product_image}" alt="">
			            	</a>
			                <div class="flex flex-col col-span-4 py-10 ml-5 text-left">
			                    <p class="font-light">${product.product_name}</p>
			                    <p class="font-light mt-5">数量: ${product.buy_count}</p>
			                    <input type="hidden" name="buy_count" value="${product.buy_count}">
			                    <input type="hidden" name="product_id" value="${product.product_id}">
			                </div>
			                <div class="flex items-center col-span-2 mx-5 text-xl font-light ">
			                    <span>\</span>
			                    <span>${product.price}</span>
			                </div>
			            </div>
		            </c:forEach>
                </div>
                <!-- Cart Lists End -->
                <!-- Modal -->
                <input type="checkbox" id="my-modal-2" class="modal-toggle">
                <div class="modal">
                    <div class="modal-box">
                        <!-- Modal Contents -->
                        <div id="modal-contents"></div>
                        <div class="modal-action ">
                            <label for="my-modal-2">
                            <input type="hidden" name="user_id" value="${user.user_id}">
                            <input type="hidden" name="name" value="${user.name}">
                            <input type="hidden" name="mail" value="${user.mail}">
                            <input type="hidden" name="total_price" value="${total_price}">
                                <button type="submit" id="modalSubmitButton" class="px-8 py-3 text-white bg-blue-400 rounded-lg font-bold">送信</button>
                            </label>
                            <label for="my-modal-2" class="btn" onclick="deleteOrder()">キャンセル</label>
                        </div>
                        <!-- Modal Contents -->
                    </div>
                </div>
                <!-- Modal End -->
            </form>
        </div>
        <!-- Shipping address, delivery method, and payment method End -->
        <!-- Check -->
        <div class="col-span-12 mt-8 lg:mt-0 lg:ml-10 lg:col-span-4 ">
            <div class="sticky top-0 px-6 bg-gray-100 border-2 border-blue-300 rounded-lg shadow ">
                <div class="flex justify-center mt-4 ">
                    <label for="my-modal-2" class="px-20 py-3 text-xl font-bold text-white bg-blue-400 rounded-md " onclick="checkOrder()">確認する</label>
                </div>
                <div class="flex justify-between py-5 text-lg border-b border-gray-400 ">
                    <span>商品合計</span>
                    <span>\ ${total_price}</span>
                </div>
                <div class="flex justify-between py-5">
                    <div>
                        <span class="text-xl font-bold ">合計</span>
                        <span class="font-light text-md ">(税込)</span>
                    </div>
                    <span class="text-2xl font-bold text-red-600 ">\ ${total_price}</span>
                </div>
            </div>
        </div>
        <!-- Check End -->
    </main>
    <!-- Main End -->
    <!-- Footer -->
    <footer class="py-10 bg-gray-200 mt-auto">
        <p class="flex justify-center text-gray-400 ">© COMOP , Inc.</p>
    </footer>
    <!-- Footer End -->
</body>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        AutoKana.bind("#firstName", "#firstNameKana", {
            katakana: true
        });
        AutoKana.bind("#lastName", "#lastNameKana", {
            katakana: true
        });
    });

    function checkOrder() {
        const modalSubmitButton = document.getElementById('modalSubmitButton');
        const inputElementValues = getInputElementValues();
        const inputLists = createInputLists(inputElementValues);

        Object.keys(inputElementValues).forEach(function(key) {
            inputElementValues[key] === '' ? modalSubmitButton.style.display = 'none' : modalSubmitButton.style.display = 'block';
        });

        document.getElementById('modal-contents').insertAdjacentHTML('beforeend', inputLists);
    }

    function getInputElementValues() {
        const inputElementValues = {
            firstName: document.getElementById('firstName').value,
            firstNameKana: document.getElementById('firstNameKana').value,
            lastName: document.getElementById('lastName').value,
            lastNameKana: document.getElementById('lastNameKana').value,
            postalCode: document.getElementById('postalCode').value,
            address: document.getElementById('address').value,
            tel: document.getElementById('tel').value,
            creditNumber: document.getElementById('creditNumber').value,
            securityNumber: document.getElementById('securityNumber').value,
            cardHolder: document.getElementById('cardHolder').value,
            expirationMonth: document.getElementById('expirationMonth').value,
            expirationYear: document.getElementById('expirationYear').value,
        };
        return inputElementValues;
    }

    function createInputLists(inputElementValues) {
        const inputLists =
            `
                <div id="inputLists" class="text-lg">
                    <p class="mb-4 text-2xl font-bold">注文内容の確認</p>
                    <p class="my-2">お名前 : \${inputElementValues.firstName} \${inputElementValues.lastName}</p>
                    <p class="my-2">お名前（カナ）: \${inputElementValues.firstNameKana} \${inputElementValues.lastNameKana}</p>
                    <p class="my-2">郵便番号 : \${inputElementValues.postalCode}</p>
                    <p class="my-2">住所 : \${inputElementValues.address}</p>
                    <p class="my-2">電話番号 : \${inputElementValues.tel}</p>
                    <p class="my-2">クレジット番号 : \${inputElementValues.creditNumber}</p>
                    <p class="my-2">セキュリティ番号 : \${inputElementValues.securityNumber}</p>
                    <p class="my-2">カード名義 : \${inputElementValues.cardHolder}</p>
                    <p class="my-2">有効期限 : \${inputElementValues.expirationMonth}月 \${inputElementValues.expirationYear}年</p>
                </div>
            `;
        return inputLists;
    }

    function deleteOrder() {
        const inputLists = document.getElementById('inputLists');
        inputLists.remove();
    }

    // enterでsubmitさせない
    document.addEventListener('keydown', function(e) {
        if (e.keyCode == 13) {
            e.preventDefault();
        }
    });

    function searchAddress() {
        const error = document.getElementById('error');
        const postalCode = document.getElementById('postalCode');
        const address = document.getElementById('address');

        const api = 'https://zipcloud.ibsnet.co.jp/api/search?zipcode=';
        const param = postalCode.value.replace("-", ""); //入力された郵便番号から「-」を削除
        const url = api + param;

        fetchJsonp(url, {
                timeout: 10000, //タイムアウト時間
            })
            .then((response) => {
                error.textContent = ''; //HTML側のエラーメッセージ初期化
                return response.json();
            })
            .then((data) => {
                //エラー時
                if (data.status === 400) {
                    error.textContent = data.message;
                }
                if (data.results === null) {
                    error.textContent = '郵便番号から住所が見つかりませんでした。';
                } else {
                    address.value = data.results[0].address1 + data.results[0].address2 + data.results[0].address3;
                }
            })
            .catch((ex) => { //例外処理
                console.log(ex);
            });
    }
</script>

</html>