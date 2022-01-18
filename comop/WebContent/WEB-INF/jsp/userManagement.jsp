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
<link href="https://cdn.jsdelivr.net/npm/basscss@latest/css/basscss.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdn.jsdelivr.net/npm/daisyui@1.16.2/dist/full.css" rel="stylesheet" type="text/css" />
<!-- tailwind css -->
<title>ユーザー一覧</title>
</head>

<body>
	<!-- Main -->
	<main id="main" class="grid grid-cols-12 gap-6 py-16 bg-white sm:px-4 lg:px-16">
		<div class="flex justify-center col-span-12">
			<a href="admin" class="px-6 py-1 text-white bg-gray-400 rounded-full">管理ページTOP</a>
		</div>
		<div class="flex flex-col items-center col-span-12 gap-3">
			<h1 class="text-2xl font-bold text-center">ユーザー登録</h1>
		</div>
		<!-- User List -->
		<div class="col-span-12 overflow-x-auto">
			<h2 class="my-5 text-2xl font-bold text-center">ユーザー一覧</h2>
			<table class="table w-full text-center table-auto">
				<thead>
					<tr>
						<th>ユーザーID</th>
						<th>名前</th>
						<th>メールアドレス</th>
						<th>住所</th>
						<th>苗字</th>
						<th>苗字（かな）</th>
						<th>名前</th>
						<th>名前（かな）</th>
						<th>電話番号</th>
						<th>郵便番号</th>
						<th>パスワード</th>
						<th>ポイント</th>
						<th>ユーザー退会フラグ</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="users" items="${data}">
						<tr class="hover">
							<th>${users.user_id}</th>
							<td>${users.name}</td>
							<td>${users.mail}</td>
							<td>${users.address}</td>
							<td>${users.first_name}</td>
							<td>${users.first_name_kana}</td>
							<td>${users.last_name}</td>
							<td>${users.last_name_kana}</td>
							<td>${users.tel}</td>
							<td>${users.postal_code}</td>
							<td>${users.password}</td>
							<td>${users.point}</td>
							<td>${users.user_lapse}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- User List End -->
	</main>
	<!-- Main End -->
</body>
</html>
