<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@1.24.3/dist/full.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2/dist/tailwind.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer"
    />
    <script src="https://cdn.jsdelivr.net/npm/tw-elements/dist/js/index.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tw-elements/dist/css/index.min.css" />
    <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <title>ポイント商品管理</title>
</head>

<body>
    <main id="main" class="grid grid-cols-12">
        <aside id="sidebar" class="grid h-full col-span-2 pt-12 text-lg bg-white text-slate-800 drop-shadow-xl">
            <ul class="text-gray-300">
                <li class="py-4 pl-4 hover:text-black">
                    <a href="getAdminUserList">
                        <i class="pr-3 text-xl bi bi-person-fill"></i>
                        <span>User</span>
                    </a>
                </li>
                <li class="py-4 pl-4 hover:text-black">
                    <a href="getAdminColorList">
                        <i class="pr-3 text-xl bi bi-palette-fill"></i>
                        <span>Color</span>
                    </a>
                </li>
                <li class="py-4 pl-4 hover:text-black">
                    <a href="getAdminProductsList">
                        <i class="pr-3 text-xl bi bi-box-seam"></i>
                        <span>Products</span>
                    </a>
                </li>
                <li class="py-4 pl-4 text-black border-l-8 border-green-500">
                    <i class="pr-3 text-xl bi bi-gift-fill"></i>
                    <span>RewardProducts</span>
                </li>
                <li class="py-4 pl-4 hover:text-black">
                    <a href="logout">
                        <i class="pr-4 text-xl bi bi-box-arrow-left"></i>
                        <span>Logout</span>
                    </a>
                </li>
            </ul>
        </aside>
        <div class="col-span-10 bg-gray-100">
            <div class="grid-cols-12 px-8 py-4 text-base font-bold bg-white">
                <p>ADMIN</p>
            </div>
            <p class="px-8 my-6 text-3xl font-light">Reward Product Admin</p>
            <div class="px-8" x-data="{ selected: 'option-1' }">
                <nav class="flex gap-4">
                    <a href="#option-1" class="px-4 py-3 font-bold" x-bind:class="{ 'border-b-4 border-green-500': selected === 'option-1' }" x-on:click="selected = 'option-1'">Reward Products</a>
                    <a href="#option-2" class="px-4 py-3 font-bold" x-bind:class="{ 'border-b-4 border-green-500': selected === 'option-2' }" x-on:click="selected = 'option-2'">Add Reward Product</a>
                    <a href="#option-3" class="px-4 py-3 font-bold" x-bind:class="{ 'border-b-4 border-green-500': selected === 'option-3' }" x-on:click="selected = 'option-3'">Edit Reward Product</a>
                </nav>
                <div x-show="selected === 'option-1'" class="mt-4 overflow-x-auto rounded-lg h-screen">
                    <table class="table w-full text-center">
                        <thead>
                            <tr>
                                <th>ポイント商品ID</th>
                                <th>ポイント商品名</th>
                                <th>ポイント商品画像</th>
                                <th>ポイント商品説明</th>
                                <th>交換ポイント数</th>
                                <th>在庫数</th>
                                <th></th>
                            </tr>
                        </thead>
                        <c:forEach var="rewardProducts" items="${data}">
                            <tr class="hover">
                                <th><c:out value="${rewardProducts.reward_product_id}" /></th>
                                <td><c:out value="${rewardProducts.reward_product_name}" /></td>
                                <td><c:out value="${rewardProducts.reward_product_image}" /></td>
                                <td><c:out value="${rewardProducts.reward_product_description}" /></td>
                                <td><c:out value="${rewardProducts.point_price}" /></td>
                                <td><c:out value="${rewardProducts.stock_quantity}" /></td>
                                <td>
                                    <a href="removeRewardProduct?reward_product_id=${rewardProducts.reward_product_id}" class="hover:underline">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <div x-show="selected === 'option-2'" class="mt-4 rounded-lg h-screen">
                    <form action="addRewardProduct" method="post" class="form-control">
                        <div class="bg-white rounded-lg">
                            <p class="py-3 font-mono text-xl text-center border-b-2">Add Reward Product</p>
                            <!-- Color Name -->
                            <div class="grid grid-cols-12 gap-6 px-5 my-8 text-lg">
                                <div class="flex items-center col-span-3">
                                    <p class="pl-8 font-bold">Reward Product Name</p>
                                </div>
                                <div class="col-span-9">
                                    <input type="text" name="reward_product_name" placeholder="reward product name" class="w-full input input-bordered">
                                </div>
                                <div class="flex items-center col-span-3">
                                    <p class="pl-8 font-bold">Reward Product Image</p>
                                </div>
                                <div class="col-span-9">
                                    <input type="text" name="reward_product_image" placeholder="reward product image path" class="w-full input input-bordered">
                                </div>
                                <div class="flex items-center col-span-3">
                                    <p class="pl-8 font-bold">Reward Product Description</p>
                                </div>
                                <div class="col-span-9">
                                    <input type="text" name="reward_product_description" placeholder="reward product description" class="w-full input input-bordered">
                                </div>
                                <div class="flex items-center col-span-3">
                                    <p class="pl-8 font-bold">Stock Quantity</p>
                                </div>
                                <div class="col-span-9">
                                    <input type="text" name="stock_quantity" placeholder="stock quantity" class="w-full input input-bordered">
                                </div>
                                <div class="flex items-center col-span-3">
                                    <p class="pl-8 font-bold">Point Price</p>
                                </div>
                                <div class="col-span-9">
                                    <input type="text" name="point_price" placeholder="point price" class="w-full input input-bordered">
                                </div>
                            </div>
                            <!-- Color Name End -->
                            <!-- Registration Button -->
                            <div class="flex justify-center my-8">
                                <button type="submit" class="max-w-lg px-32 py-2 text-center text-white bg-gray-400 rounded-full">REGISTER</button>
                            </div>
                            <!-- Registration Button End -->
                        </div>
                    </form>
                </div>
                <div x-show="selected === 'option-3'" class="mt-4 rounded-lg h-screen">
                    <form action="editRewardProduct" method="post" class="form-control">
                        <div class="bg-white rounded-lg">
                            <p class="py-3 font-mono text-xl text-center border-b-2">Edit Reward Product</p>
                            <!-- Color Name -->
                            <div class="grid grid-cols-12 gap-6 px-5 my-8 text-lg">
                                <div class="flex items-center col-span-3">
                                    <p class="pl-8 font-bold">Reward Product ID</p>
                                </div>
                                <div class="col-span-9">
                                    <input type="text" name="reward_product_id" placeholder="reward product id" class="w-full input input-bordered">
                                </div>
                                <div class="flex items-center col-span-3">
                                    <p class="pl-8 font-bold">Reward Product Name</p>
                                </div>
                                <div class="col-span-9">
                                    <input type="text" name="reward_product_name" placeholder="reward product name" class="w-full input input-bordered">
                                </div>
                                <div class="flex items-center col-span-3">
                                    <p class="pl-8 font-bold">Reward Product Image</p>
                                </div>
                                <div class="col-span-9">
                                    <input type="text" name="reward_product_image" placeholder="reward product image path" class="w-full input input-bordered">
                                </div>
                                <div class="flex items-center col-span-3">
                                    <p class="pl-8 font-bold">Reward Product Description</p>
                                </div>
                                <div class="col-span-9">
                                    <input type="text" name="reward_product_description" placeholder="reward product description" class="w-full input input-bordered">
                                </div>
                                <div class="flex items-center col-span-3">
                                    <p class="pl-8 font-bold">Stock Quantity</p>
                                </div>
                                <div class="col-span-9">
                                    <input type="text" name="stock_quantity" placeholder="stock quantity" class="w-full input input-bordered">
                                </div>
                                <div class="flex items-center col-span-3">
                                    <p class="pl-8 font-bold">Point Price</p>
                                </div>
                                <div class="col-span-9">
                                    <input type="text" name="point_price" placeholder="point price" class="w-full input input-bordered">
                                </div>
                            </div>
                            <!-- Color Name End -->
                            <!-- Registration Button -->
                            <div class="flex justify-center my-8">
                                <button type="submit" class="max-w-lg px-32 py-2 text-center text-white bg-gray-400 rounded-full">REGISTER</button>
                            </div>
                            <!-- Registration Button End -->
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
</body>

</html>