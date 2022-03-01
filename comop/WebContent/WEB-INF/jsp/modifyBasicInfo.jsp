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
    <title>基本情報の変更</title>
</head>

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
            <form method="post" action="editUserInfo" id="memberRegistInfo" class="flex flex-col p-10 bg-gray-200 border border-2 border-gray-300 rounded-lg">
                <h2 class="pb-4 text-2xl border-b border-gray-400">基本情報の変更</h2>
                <input type="hidden" name="user_id" value="${user.user_id}">
                <input type="hidden" name="name" value="${user.name}">
                <!-- Name -->
                <div class="grid grid-cols-12 py-5 border-t border-b border-gray-400">
                    <div class="flex flex-row items-center col-span-4 lg:col-span-3">
                        <span class="text-lg">お名前</span>
                        <span class="ml-4 font-bold text-red-600">必須</span>
                    </div>
                    <div class="flex flex-row col-span-8 gap-5 lg:col-span-9">
                        <input type="text" name="firstName" id="firstName" autocomplete="given-name" placeholder="例）上尾" value="${user.first_name}" class="w-1/2 px-3 py-2 focus:outline-blue-400" required>
                        <input type="text" name="lastName" id="lastName" autocomplete="family-name" placeholder="太郎" value="${user.last_name}" class="w-1/2 px-3 py-2 focus:outline-blue-400" required>
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
                        <input type="text" name="firstNameKana" id="firstNameKana" placeholder="例）アゲオ" value="${user.first_name_kana}" class="w-1/2 px-3 py-2 focus:outline-blue-400" required>
                        <input type="text" name="lastNameKana" id="lastNameKana" placeholder="タロウ" value="${user.last_name_kana}" class="w-1/2 px-3 py-2 focus:outline-blue-400"  required>
                    </div>
                </div>
                <!-- Name(kana) End -->
                <!-- Mail Address -->
                <div class="grid grid-cols-12 py-5 border-b border-gray-400">
                    <div class="flex flex-row items-center col-span-4 lg:col-span-3">
                        <span class="text-lg">メールアドレス</span>
                        <span class="ml-4 font-bold text-red-600">必須</span>
                    </div>
                    <div class="flex flex-row items-center col-span-8 gap-5 lg:col-span-9">
                        <input type="email" name="mail" id="mail" placeholder="XXX.gmail.com" value="${user.mail}" class="w-1/2 px-3 py-2 focus:outline-blue-400"  pattern=".+\.[a-zA-Z0-9][a-zA-Z0-9-]{0,61}[a-zA-Z0-9]" title="メールアドレスは、aaa@example.com のような形式で記入してください。" required>
                    </div>
                </div>
                <!-- Mail Address End -->
                <!-- Tel -->
                <div class="grid grid-cols-12 py-5 border-b border-gray-400">
                    <div class="flex flex-row items-center col-span-4 lg:col-span-3">
                        <span class="text-lg">電話番号</span>
                        <span class="ml-4 font-bold text-red-600">必須</span>
                    </div>
                    <div class="flex flex-row items-center col-span-8 gap-5 lg:col-span-9">
                        <input type="text" name="tel" id="tel" class="w-1/2 px-3 py-2 focus:outline-blue-400" value="${user.tel}" required>
                    </div>
                </div>
                <!-- Tel End -->
                <!-- Postal Code -->
                <div class="grid grid-cols-12 py-5 border-b border-gray-400">
                    <div class="flex flex-row items-center col-span-4 lg:col-span-3">
                        <span class="text-lg">郵便番号</span>
                        <span class="ml-4 font-bold text-red-600">必須</span>
                    </div>
                    <div class="flex flex-row items-center col-span-8 gap-5 lg:col-span-9">
                        <input type="text" name="postalCode" id="postalCode" autocomplete="postal-code" placeholder="100-0002" value="${user.postal_code}" class="w-1/2 px-3 py-2 focus:outline-blue-400"  required>
                        <a href="https://www.post.japanpost.jp/zipcode/index.html" class="text-blue-400 hover:underline">郵便番号を調べる<i class="ml-3 bi bi-box-arrow-up-right"></i></a>
                    </div>
                </div>
                <!-- Postal Code End -->
                <!-- Address -->
                <div class="grid grid-cols-12 py-5 border-b border-gray-400">
                    <div class="flex flex-row items-center col-span-4 lg:col-span-3">
                        <span class="text-lg">住所</span>
                        <span class="ml-4 font-bold text-red-600">必須</span>
                    </div>
                    <div class="flex flex-row items-center col-span-8 gap-5 lg:col-span-9">
                        <input type="text" name="address" id="address" placeholder="東京都千代田区千代田" autocomplete="address" value="${user.address}" class="w-full lg:w-1/2 px-3 py-2 focus:outline-blue-400">
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
                                <button type="submit" id="modalSubmitButton" type="submit" class="px-5 py-3 bg-blue-500 text-white font-bold rounded-lg">送信</button>
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
	function getInputElementsValue() {
	    const inputElementValues = {
	        firstName: document.getElementById('firstName').value,
	        lastName: document.getElementById('lastName').value,
	        firstNameKana: document.getElementById('firstNameKana').value,
	        lastNameKana: document.getElementById('lastNameKana').value,
	        mail: document.getElementById('mail').value,
	        tel: document.getElementById('tel').value,
	        postalCode: document.getElementById('postalCode').value,
	        address: document.getElementById('address').value
	    };
	    return inputElementValues;
	}

	function createInputLists(inputElementValues) {
	    const { firstName,lastName,firstNameKana,lastNameKana,mail,tel,postalCode,address } = inputElementValues;
	    const inputLists = `
	        <div id="inputLists" class="text-lg">
	            <p class="mb-4 text-2xl font-bold">変更内容の確認</p>
	            <p class="my-2">お名前： \${firstName} \${lastName}</p>
	            <p class="my-2">お名前（カナ）： \${firstNameKana} \${lastNameKana}</p>
	            <p class="my-2">電話番号： \${tel}</p>
	            <p class="my-2">メールアドレス： \${mail}</p>
	            <p class="my-2">郵便番号： \${postalCode}</p>
	            <p class="my-2">住所： \${address}</p>
	        </div>
	    `;
	    return inputLists;
	}

	function checkBasicInfo() {
        const modalSubmitButton = document.getElementById('modalSubmitButton');
	    const inputElementValues = getInputElementsValue();
	    const inputLists = createInputLists(inputElementValues);

	    console.log(modalSubmitButton);

	    Object.keys(inputElementValues).forEach(function(key) {
	        inputElementValues[key] === '' ? modalSubmitButton.style.display = 'none' : modalSubmitButton.style.display = 'block';
	    });

	    document.getElementById('inputValues').insertAdjacentHTML('beforeend', inputLists);
	}

    function deleteBasicInfo() {
        const inputLists = document.getElementById('inputLists');
        inputLists.remove();
        console.log(inputLists);
    }
</script>

</html>