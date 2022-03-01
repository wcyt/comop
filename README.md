## 開発環境
- OS: Windows10 Home Pro
- Language: Java 8, HTML, CSS(Tailwind CSS), javaScript(Alpine.js)
- DB: MySQL 8.0.20
- Server: Tomcat 8.5

## 制作で躓いた部分
- SQLで列名と表名を指定するとき、小文字にしないとAWSの時に取得・追加・更新・削除ができない
```
NG例： INSERT INTO NAME FROM USER_TABLE;
OK例： INSERT INTO name FROM user_table;
```

- 画像を表示させるときWebContent直下にして、かつweb.xmlで
```
	<servlet-mapping>
		<servlet-name>default</servlet-name>
		<url-pattern>/images/*</url-pattern>
	</servlet-mapping>
```
- を書かないと表示されない（JSも同様）

## フォルダ構成

<pre>
├── comop
│   ├── WebContent
│   │   ├── META-INF
│   │   │   └── MANIFEST.MF
│   │   ├── WEB-INF
│   │   │   ├── jsp
│   │   │   │   ├── 404.jsp                                 // エラーページ
│   │   │   │   ├── 500.jsp                                 // エラーページ
│   │   │   │   ├── Footer.jsp                              // フッター
│   │   │   │   ├── Header.jsp                              // ヘッダー
│   │   │   │   ├── cart.jsp                              　// カートページ
│   │   │   │   ├── colorManagement.jsp                     // 色管理ページ（Admin）
│   │   │   │   ├── default.jsp                             // 登録情報一覧ページ
│   │   │   │   ├── favorite.jsp                            // お気に入りページ
│   │   │   │   ├── leave.jsp                               // 退会ページ
│   │   │   │   ├── modifyAddress.jsp                       // メールアドレス変更ページ
│   │   │   │   ├── modifyBasicInfo.jsp                     // 基本情報変更ページ
│   │   │   │   ├── modifyPassword.jsp                      // パスワード変更ページ
│   │   │   │   ├── orderHistory.jsp                        // 注文履歴確認ページ
│   │   │   │   ├── productDetail.jsp                       // 商品詳細ページ
│   │   │   │   ├── productManagement.jsp                   // 商品管理ページ（Admin）
│   │   │   │   ├── productsList.jsp                        // 商品一覧ページ
│   │   │   │   ├── rewardProductManagement.jsp　           // ポイント商品一覧ページ
│   │   │   │   ├── rewardProductOrderHistory.jsp           // ポイント商品交換履歴ページ
│   │   │   │   ├── rewardProductsList.jsp                  // ポイント商品一覧ページ
│   │   │   │   ├── select.jsp                              // お届け先・配送方法・お支払い指定ページ
│   │   │   │   ├── signIn.jsp                              // ログインページ
│   │   │   │   ├── signUp.jsp                              // 会員登録ページ
│   │   │   │   ├── signUpComplete.jsp                      // 会員完了ページ
│   │   │   │   ├── taglib.jsp                              // タグライブラリまとめ
│   │   │   │   ├── top.jsp                              　 // トップページ
│   │   │   │   └── userManagement.jsp                      // ユーザー管理ページ（Admin）
│   │   │   ├── lib
│   │   │   │   ├── jstl.jar                                // タグライブラリ
│   │   │   │   ├── mysql-connector-java-8.0.22.jar　　　　  // MySQL接続用
│   │   │   │   ├── ojdbc7.jar                              // Oracle JDBCドライバ
│   │   │   │   ├── servlet-api.jar
│   │   │   │   └── standard.jar
│   │   │   └── web.xml
│   │   ├── images　
│   │   │
│   │   └── js
│   │       └── autokana.js                                   // 名前入力時にカナ変換
│   └── src
│       ├── bean
│       │   ├── CartBean.java                                 // cart_tableのBean
│       │   ├── ColorBean.java                                // color_tableのBean
│       │   ├── CreditBean.java                               // credit_tableのBean
│       │   ├── FavoriteBean.java                             // favorite_tableのBean
│       │   ├── OrderBean.java                                // order_tableのBean
│       │   ├── OrderDetailBean.java                          // order_detail_tableのBean
│       │   ├── PointOrderBean.java                           // point_order_tableのBean
│       │   ├── PointRewardBean.java                          // point_reward_tableのBean
│       │   ├── ProductBean.java                              // product_tableのBean
│       │   ├── StockBean.java                                // stock_tableのBean
│       │   └── UserBean.java                                 // user_tableのBean
│       ├── command
│       │   ├── AbstractCommand.java                          //
│       │   ├── CommandFactory.java                           // プロパティファイルの読み込み・インスタンス化
│       │   ├── admin                                         // 管理者関係
│       │   │   ├── AddColorCommand.java                     // 色の追加
│       │   │   ├── AddProductCommand.java                   // 商品の追加
│       │   │   ├── AddRewardProductCommand.java             // ポイント商品の追加
│       │   │   ├── EditProductCommand.java                  // 商品編集
│       │   │   ├── EditRewardProductCommand.java            // ポイント商品編集
│       │   │   ├── GetColorListCommand.java                 // 色一覧の取得
│       │   │   ├── GetProductsListCommand.java              // 商品一覧の取得
│       │   │   ├── GetRewardProductsListCommand.java        // ポイント商品一覧の取得
│       │   │   ├── GetUserListCommand.java                  // ユーザー一覧の取得
│       │   │   ├── LapseUserCommand.java                    // ユーザーの退会
│       │   │   ├── RemoveColorCommand.java                  // 色の削除
│       │   │   ├── RemoveProductCommand.java                // 商品の削除
│       │   │   └── RemoveRewardProductCommand.java          // ポイント商品の削除
│       │   ├── cart                                          // カート関係
│       │   │   ├── AddCartCommand.java                      // カートに追加
│       │   │   ├── DecreaseBuyCountCommand.java             // 購入個数を一つ減らす
│       │   │   ├── GetCartListCommand.java                  // カートに追加された商品一覧の取得
│       │   │   ├── IncreaseBuyCountCommand.java             // 購入個数を一つ増やす
│       │   │   └── RemoveCartCommand.java                   // カートに追加した商品の削除
│       │   ├── favorite                                      // お気に入り関係
│       │   │   ├── AddFavoriteCommand.java                  // お気に入りに追加
│       │   │   ├── GetFavoriteListCommand.java              // お気に入りに追加された商品一覧の取得
│       │   │   └── RemoveFavoriteCommand.java               // お気に入りの削除
│       │   ├── move                                          // 移動関係
│       │   │   ├── MoveLeaveCommand.java                    // 退会ページへ移動
│       │   │   ├── MoveModifyAddressCommand.java            // メールアドレス変更ページへ移動
│       │   │   ├── MoveModifyBasicInfoCommand.java          // 基本情報編集ページへ移動
│       │   │   ├── MoveModifyPasswordCommand.java           // パスワード変更ページへ移動
│       │   │   ├── MoveSelectCommand.java                   // お届け先・配送方法・お支払い指定ページへ移動
│       │   │   ├── MoveSignInCommand.java                   // ログインページへ移動
│       │   │   ├── MoveSignUpCommand.java                   // ログオン（会員登録）ページへ移動
│       │   │   └── MoveTopCommand.java                      // トップページへ移動
│       │   ├── order                                         // 注文関係
│       │   │   ├── AddOrderCommand.java                     // 商品を注文
│       │   │   ├── AddPointOrderCommand.java                // ポイント商品を注文
│       │   │   ├── GetOrderListCommand.java                 // 注文履歴一覧を取得
│       │   │   └── GetPointOrderListCommand.java            // ポイント商品注文履歴を取得
│       │   ├── product                                       // 商品関係
│       │   │   ├── GetProductDetailCommand.java             // 商品詳細を取得
│       │   │   ├── GetProductsListCommand.java              // 商品一覧を取得
│       │   │   ├── GetRewardProductsListCommand.java        // ポイント商品一覧を取得
│       │   │   ├── RefineSearchCommand.java                 // 絞り込み検索
│       │   │   ├── SearchProductsCommand.java               // 商品検索
│       │   │   ├── SearchRewardProductsCommand.java         // ポイント商品検索
│       │   │   ├── SortFavoriteCountCommand.java            // お気に入り数でソートされた商品一覧の取得
│       │   │   └── SortProductsCommand.java                 // 値段でソートされた商品一覧の取得
│       │   └── user                                          // ユーザー関連
│       │       ├── ChangePasswordCommand.java                // パスワード変更
│       │       ├── CreateAccountCommand.java                 // アカウント作成
│       │       ├── EditUserInfoCommand.java                  // ユーザー情報編集
│       │       ├── GetOrderHistoryCommand.java               // 注文履歴を取得
│       │       ├── GetUserInfoCommand.java                   // ユーザー情報の取得
│       │       ├── LapseUserCommand.java                     // ユーザーの退会
│       │       ├── LoginCommand.java                         // ログイン
│       │       └── LogoutCommand.java                        // ログアウト
│       ├── commands.properties                                // コマンドのプロパティファイル
│       ├── dao
│       │   ├── Connector.java
│       │   ├── admin
│       │   │   ├── ColorManagementDAO.java
│       │   │   ├── MySQLColorManagementDAO.java
│       │   │   ├── MySQLPointProductManagementDAO.java
│       │   │   ├── MySQLProductManagementDAO.java
│       │   │   ├── MySQLStockDAO.java
│       │   │   ├── MySQLUserManagementDAO.java
│       │   │   ├── PointProductManagementDAO.java
│       │   │   ├── ProductManagementDAO.java
│       │   │   ├── StockDAO.java
│       │   │   └── UserManagementDAO.java
│       │   ├── cart
│       │   │   ├── CartDAO.java
│       │   │   └── MySQLCartDAO.java
│       │   ├── favorite
│       │   │   ├── FavoriteDAO.java
│       │   │   └── MySQLFavoriteDAO.java
│       │   ├── order
│       │   │   ├── MySQLOrderDAO.java
│       │   │   ├── MySQLPointOrderDAO.java
│       │   │   ├── OrderDAO.java
│       │   │   └── PointOrderDAO.java
│       │   ├── product
│       │   │   ├── MySQLPointProductDAO.java
│       │   │   ├── MySQLProductDAO.java
│       │   │   ├── PointProductDAO.java
│       │   │   └── ProductDAO.java
│       │   └── user
│       │       ├── MySQLUserDAO.java
│       │       └── UserDAO.java
│       ├── dao.properties
│       ├── daofactory
│       │   ├── AbstractDaoFactory.java
│       │   └── MySQLDaoFactory.java
│       └── tera
│           ├── ApplicationController.java
│           ├── FrontServlet.java
│           ├── RequestContext.java
│           ├── ResponseContext.java
│           ├── WebApplicationController.java
│           ├── WebRequestContext.java
│           └── WebResponseContext.java
└── test.txt
</pre>

## テーブル

<pre>
CREATE TABLE `user_table` (
	`user_id` INT unsigned AUTO_INCREMENT,
	`name` VARCHAR(40) NOT NULL,
	`mail` VARCHAR(100) NOT NULL,
	`address` VARCHAR(300),
	`first_name` VARCHAR(20),
	`first_name_kana` VARCHAR(30),
	`last_name` VARCHAR(20),
	`last_name_kana` VARCHAR(30),
	`tel` VARCHAR(12),
	`postal_code` VARCHAR(8),
	`password` VARCHAR(32) NOT NULL,
	`point` INT unsigned DEFAULT 0,
	`user_lapse` BOOLEAN DEFAULT false,
	UNIQUE KEY `mail`(`mail`),
	CONSTRAINT `user_id_pk` PRIMARY KEY(`user_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
​
CREATE TABLE `credit_table` (
	`user_id` INT unsigned NOT NULL,
	`credit_number` VARCHAR(16) NOT NULL,
	`card_holder` VARCHAR(20) NOT NULL,
	`security_code` VARCHAR(4) NOT NULL,
	`expiration_date` VARCHAR(4) NOT NULL,
	CONSTRAINT `credit_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user_table`(`user_id`),
	PRIMARY KEY(user_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
​
CREATE TABLE `color_table` (
	`color_id` INT unsigned AUTO_INCREMENT,
	`color_name` VARCHAR(10) NOT NULL,
	CONSTRAINT `color_id_pk` PRIMARY KEY (`color_id`),
	UNIQUE KEY `color_name`(`color_name`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
​
CREATE TABLE `product_table` (
	`product_id` INT unsigned AUTO_INCREMENT,
	`color_id` INT unsigned NOT NULL,
	`product_name` VARCHAR(100) NOT NULL,
	`product_image` VARCHAR(750) NOT NULL,
	`product_description` VARCHAR(750),
	`stock_quantity` INT unsigned NOT NULL,
	`price` INT unsigned NOT NULL,
	`size` VARCHAR(6) NOT NULL,
	`material` VARCHAR(16) NOT NULL,
	`packing_type` VARCHAR(6) NOT NULL,
	`favorite_count` INT unsigned DEFAULT 0,
	UNIQUE KEY `product_image`(`product_image`),
	CONSTRAINT `product_id_pk` PRIMARY KEY (`product_id`),
	CONSTRAINT `product_color_id_fk` FOREIGN KEY (`color_id`) REFERENCES `color_table`(`color_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
​
CREATE TABLE `favorite_table` (
	`user_id` INT unsigned NOT NULL,
	`product_id` INT unsigned NOT NULL,
	CONSTRAINT `favorite_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user_table`(`user_id`),
	CONSTRAINT `favorite_product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `product_table`(`product_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
​
CREATE TABLE `point_reward_table` (
	`reward_product_id` INT unsigned AUTO_INCREMENT,
	`reward_product_name` VARCHAR(100) NOT NULL,
	`reward_product_image` VARCHAR(750) NOT NULL,
	`reward_product_description` VARCHAR(750),
	`stock_quantity` INT unsigned NOT NULL,
	`point_price` INT unsigned NOT NULL,
	UNIQUE KEY `reward_product_image`(`reward_product_image`),
	CONSTRAINT `reward_product_id_pk` PRIMARY KEY (`reward_product_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
​
CREATE TABLE `order_table` (
	`order_id` INT unsigned AUTO_INCREMENT,
	`user_id` INT unsigned NOT NULL,
	`order_date` DATETIME DEFAULT(sysdate()),
	`total_price` INT unsigned NOT NULL,
	`shipped` BOOLEAN DEFAULT false,
	CONSTRAINT `order_id_pk` PRIMARY KEY (`order_id`),
	CONSTRAINT `order_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user_table`(`user_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
​
CREATE TABLE `order_detail` (
	`order_id` INT unsigned NOT NULL,
	`product_id` INT unsigned NOT NULL,
	`buy_count` INT unsigned NOT NULL,
	CONSTRAINT `detail_order_id_fk` FOREIGN KEY (`order_id`) REFERENCES `order_table`(`order_id`),
	CONSTRAINT `detail_product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `product_table`(`product_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
​
CREATE TABLE `point_order_table` (
	`point_order_id` INT unsigned AUTO_INCREMENT,
	`reward_product_id` INT unsigned NOT NULL,
	`user_id` INT unsigned NOT NULL,
	`order_date` DATETIME DEFAULT(sysdate()),
	`buy_count` INT unsigned NOT NULL,
	`total_point_price` INT unsigned NOT NULL,
	CONSTRAINT `point_order_id_pk` PRIMARY KEY (`point_order_id`),
	CONSTRAINT `point_order_reward_id_fk` FOREIGN KEY (`reward_product_id`) REFERENCES `point_reward_table`(`reward_product_id`),
	CONSTRAINT `point_order_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user_table`(`user_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
​
CREATE TABLE `cart_table` (
	`user_id` INT unsigned NOT NULL,
	`product_id` INT unsigned NOT NULL,
	`buy_count` INT unsigned DEFAULT 1,
	CONSTRAINT `cart_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user_table`(`user_id`),
	CONSTRAINT `cart_product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `product_table`(`product_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
​
CREATE TABLE `stock_table` (
	`stock_change_id` INT unsigned AUTO_INCREMENT,
	`user_id` INT unsigned NOT NULL,
	`product_id` INT unsigned NOT NULL,
	`old_stock` INT unsigned NOT NULL,
	`new_stock` INT unsigned NOT NULL,
	`stock_change` INT NOT NULL,
	CONSTRAINT `stock_table_id_pk` PRIMARY KEY (`stock_change_id`),
	CONSTRAINT `stock_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user_table`(`user_id`),
	CONSTRAINT `stock_product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `product_table`(`product_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert into `color_table` values(null, 'ホワイト');
insert into `color_table` values(null, 'ブラック');
insert into `color_table` values(null, 'レッド');
insert into `color_table` values(null, 'グリーン');
insert into `color_table` values(null, 'ブルー');
insert into `color_table` values(null, 'イエロー');
insert into `color_table` values(null, 'オレンジ');
insert into `color_table` values(null, 'ブラウン');
insert into `color_table` values(null, 'ベージュ');
insert into `color_table` values(null, 'グレー');
insert into `color_table` values(null, 'ピンク');
insert into `color_table` values(null, 'カーキ');
insert into `color_table` values(null, 'ネイビー');
insert into `color_table` values(null, 'パープル');
insert into `color_table` values(null, 'パステルグリーン');
insert into `color_table` values(null, 'パステルブルー');
insert into `color_table` values(null, 'その他');

insert into product_table values(null, 2, '【個別包装・50枚入り】Airish 立体マスク ブラック', 'box_black1.jpg', 'null', 100, 3780, 'ふつう', '不織布', '個別包装', default);
insert into product_table values(null, 5, '【大容量・50枚入り】プリーツマスク ブルー', 'box_blue1.jpg', 'null', 100, 1780, 'ふつう', '不織布', '大容量', default);
insert into product_table values(null, 5, '【大容量・50枚入り】サージカルマスク ブルー', 'box_blue2.jpg', 'null', 100, 2480, 'ふつう', '不織布', '大容量', default);
insert into product_table values(null, 10, '【大容量・50枚入り】三層構造プリーツマスク グレー', 'box_gray1.jpg', 'null', 100, 1780, 'ふつう', '不織布', '大容量', default);
insert into product_table values(null, 10, '【大容量・50枚入り】プリーツマスク グレー', 'box_gray2.jpg', 'null', 100, 1780, '小さめ', '不織布', '大容量', default);
insert into product_table values(null, 11, '【大容量・10枚入り】立体マスク ピンク', 'box_pink1.jpg', 'null', 100, 890, 'ふつう', '不織布', '大容量', default);
insert into product_table values(null, 1, '【大容量・50枚入り】プリーツマスク ホワイト', 'box_white1.jpg', 'null', 100, 1480, 'ふつう', '不織布', '大容量', default);
insert into product_table values(null, 1, '【大容量・50枚入り】立体マスク ホワイト', 'box_white2.jpg', 'null', 100, 1680, 'ふつう', '不織布', '大容量', default);
insert into product_table values(null, 1, '【大容量・50枚入り】三層構造 プリーツマスク ホワイト', 'box_white3.jpg', 'null', 100, 1380, 'ふつう', '不織布', '大容量', default);
insert into product_table values(null, 1, '【大容量・50枚入り】三層構造 プリーツマスク ホワイト', 'box_white4.jpg', 'null', 100, 1980, 'ふつう', '不織布', '大容量', default);
insert into product_table values(null, 1, '【大容量・50枚入り】SHARP 抗菌プリーツマスク ホワイト', 'box_white5.png', 'null', 100, 2860, 'ふつう', '不織布', '大容量', default);
insert into product_table values(null, 9, '【個別包装・5枚入り】ウレタンマスク ベージュ', 'package_biege1.jpg', 'null', 100, 1200, '小さめ', 'ウレタン', '個別包装', default);
insert into product_table values(null, 2, '【個別包装・3枚入り】布マスク ブラック 繰り返し利用可', 'package_black1.jpg', 'null', 100, 780, 'ふつう', '布', '個別包装', default);
insert into product_table values(null, 5, '【個別包装・5枚入り】 布マスク ブルー 繰り返し利用可', 'package_blue1.jpg', 'null', 100, 1380, '小さめ', '布', '個別包装', default);
insert into product_table values(null, 5, '【個別包装・3枚入り】MIZUNO 布マスク ブルー 繰り返し利用可', 'package_blue2.jpg', 'null', 100, 1380, 'ふつう', '布', '個別包装', default);
insert into product_table values(null, 5, '【個別包装・5枚入り】ウレタンマスク ブルー', 'package_blue3.jpg', 'null', 100, 1200, '小さめ', 'ウレタン', '個別包装', default);
insert into product_table values(null, 10, '【1枚入り】UNDER ARMOUR スポーツマスク 繰り返し利用可', 'package_gray1.jpg', 'null', 100, 2970, 'ふつう', '布', '個別包装', default);
insert into product_table values(null, 4, '【個別包装・5枚入り】ウレタンマスク グリーン', 'package_green1.jpg', 'null', 100, 1200, '小さめ', 'ウレタン', '個別包装', default);
insert into product_table values(null, 4, '【個別包装・3枚入り】ウレタンマスク グリーン', 'package_green2.jpg', 'null', 100, 780, 'ふつう', 'ウレタン', '個別包装', default);
insert into product_table values(null, 11, '【個別包装・3枚入り】ウレタンマスク ピンク', 'package_pink1.jpg', 'null', 100, 780, '小さめ', 'ウレタン', '個別包装', default);
insert into product_table values(null, 11, '【個別包装・5枚入り】ウレタンマスク ピンク', 'package_pink2.jpg', 'null', 100, 1200, '小さめ', 'ウレタン', '個別包装', default);
insert into product_table values(null, 14, '【個別包装・3枚入り】ウレタンマスク パープル', 'package_purple1.jpg', 'null', 100, 780, '小さめ', 'ウレタン', '個別包装', default);
insert into product_table values(null, 1, '【5枚入り】SHARP 抗菌立体マスク ホワイト', 'package_white1.jpg', 'null', 100, 680, 'ふつう', '不織布', '個別包装', default);
insert into product_table values(null, 1, '【10枚入り】プリーツマスク ホワイト', 'package_white2.jpg', 'null', 100, 550, 'ふつう', '不織布', '個別包装', default);
insert into product_table values(null, 1, '【個別包装・5枚入り】ウレタンマスク ホワイト', 'package_white3.jpg', 'null', 100, 980, 'ふつう', 'ウレタン', '個別包装', default);
insert into product_table values(null, 12, '【大容量・50枚入り】プリーツマスク カーキ', 'box_khaki1.jpg', 'null', 100, 500, 'ふつう', '不織布', '大容量', default);
insert into product_table values(null, 13, '【大容量・50枚入り】プリーツマスク ネイビー', 'box_navy1.jpg', 'null', 100, 1320, 'ふつう', '不織布', '大容量', default);
insert into product_table values(null, 7, '【大容量・50枚入り】プリーツマスク ブルー', 'box_orange1.jpg', 'null', 100, 1280, 'ふつう', '不織布', '大容量', default);
insert into product_table values(null, 15, '【大容量・50枚入り】立体構造プリーツマスク パステルグリーン', 'box_pastelgreen1.jpg', 'null', 100, 790, '小さめ', '不織布', '大容量', default);
insert into product_table values(null, 6, '【大容量・40枚入り】プリーツマスク イエロー', 'box_yellow1.jpg', 'null', 100, 680, 'ふつう', '不織布', '大容量', default);
insert into product_table values(null, 12, '【個包装・3枚入り】顔密着型ピッタマスク カーキ', 'package_khaki1.jpg', 'null', 100, 380, 'ふつう', 'ポリウレタン', '個包装', default);
insert into product_table values(null, 5, '【個包装・5枚入り】プリーツマスク ネイビー', 'package_navy1.jpg', 'null', 100, 290, 'ふつう', '不織布', '個包装', default);
insert into product_table values(null, 7, '【個包装・3枚入り】立体 布マスク オレンジ', 'package_orange1.jpg', 'null', 100, 370, 'ふつう', '布', '個包装', default);
insert into product_table values(null, 16, '【個包装・5枚入り】立体 布マスク パステルブルー', 'package_pastelblue1.jpg', 'null', 100, 350, 'ふつう', '布', '個包装', default);
insert into product_table values(null, 16, '【個包装・1枚入り】立体構造 布マスク パステルブルー', 'package_pastelblue2.jpg', 'null', 100, 110, 'ふつう', '布', '個包装', default);
insert into product_table values(null, 15, '【個包装・1枚入り】立体 布マスク パステルグリーン', 'package_pastelgreen1.png', 'null', 100, 100, 'ふつう', '布', '個包装', default);
insert into product_table values(null, 11, '【個包装・10枚入り】ダイヤモンド形状 不織布マスク ピンク', 'package_pink3.jpg', 'null', 100, 680, 'ふつう', '不織布', '個包装', default);insert into product_table values(null, 2, '【個包装・5枚入り】ポリウレタンマスク ピンク', 'package_pink2.jpg', 'null', 100, 480, 'ふつう', 'ポリウレタン', '個包装', default);
insert into product_table values(null, 14, '【個別包装・10枚入り】 ダイヤモンド形状 不織布マスク パープル', 'package_purple2.jpg', 'null', 100, 680, 'ふつう', '不織布', '個包装', default);
insert into product_table values(null, 3, '【個別包装・3枚入り】無地カラー 布マスク レッド', 'package_red2.jpg', 'null', 100, 360, 'ふつう', '布', '個包装', default);
insert into product_table values(null, 3, '【個包装・1枚入り】布マスク レッド', 'package_red1.jpg', 'null', 100, 120, 'ふつう', '布', '個包装', default);
insert into product_table values(null, 6, '【個包装・1枚入り】布マスク イエロー', 'package_yellow1.jpg', 'null', 100, 120, 'ふつう', '布', '個包装', default);
insert into product_table values(null, 8, '【個別包装・20枚入り】三層構造 不織布マスク ブラウン', 'package_brown1.jpg', 'null', 100, 740, 'ふつう', '不織布', '個包装', default);

insert into product_table values(null, 2, '【大容量・50枚入り】子供用 口元らくらく立体 不織布マスク ブラック', 'k_box_black1.jpg', 'null', 100, 980, '小さめ', '不織布', '大容量', default);
insert into product_table values(null, 10, '【大容量・30枚入り】子供用 ウルトラフィットマスク グレー', 'k_box_gray1.jpg', 'null', 100, 790, '小さめ', '不織布', '大容量', default);
insert into product_table values(null, 10, '【大容量・30枚入り】子供用 KF94マスク グレー', 'k_box_gray2.jpg', 'null', 100, 860, '小さめ', '不織布', '大容量', default);
insert into product_table values(null, 4, '【大容量・30枚入り】子供用 KF94マスク グリーン', 'k_box_green1.jpg', 'null', 100, 980, '小さめ', '不織布', '大容量', default);
insert into product_table values(null, 17, '【大容量・30枚入り】子供用 はらぺこあおむし 不織布マスク', 'k_box_other1.jpg', 'null', 100, 920, '小さめ', '不織布', '大容量', default);
insert into product_table values(null, 17, '【大容量・20枚入り】子供用 マイメロディ 立体マスク ', 'k_box_other2.jpg', 'null', 100, 830, '小さめ', '不織布', '大容量', default);
insert into product_table values(null, 17, '【大容量・30枚入り】子供用 プラレール 不織布マスク', 'k_box_other3.jpg', 'null', 100, 900, '小さめ', '不織布', '大容量', default);
insert into product_table values(null, 17, '【大容量・20枚入り】子供用 ディズニー 立体マスク', 'k_box_other4.jpg', 'null', 100, 790, '小さめ', '不織布', '大容量', default);
insert into product_table values(null, 1, '【大容量・30枚入り】子供の贅沢マスク ホワイト', 'box_white2.jpg', 'null', 100, 1380, '小さめ', '不織布', '大容量', default);
insert into product_table values(null, 17, '【大容量・20枚入り】子供用 恐竜マスク', 'k_box_other6.jpg', 'null', 100, 840, '小さめ', '不織布', '大容量', default);
insert into product_table values(null, 17, '【大容量・30枚入り】子供用 トミカマスク', 'k_box_other7.png', 'null', 100, 880, '小さめ', '不織布', '大容量', default);
insert into product_table values(null, 1, '【2枚入り】子供用 しろたん 立体布マスク ホワイト', 'k_package_white2.jpg', 'null', 100, 90, '小さめ', '布', '個別包装', default);
insert into product_table values(null, 17, '【大容量・20枚入り】子供用 いないいないばぁっ！マスク', 'k_box_other9.jpg', 'null', 100, 870, '小さめ', '不織布', '大容量', default);
insert into product_table values(null, 1, '【個別包装・3枚入り】子供用 超快適マスク ホワイト', 'k_package_white1.jpg', 'null', 100, 110, '小さめ', '不織布', '個別包装', default);
insert into product_table values(null, 17, '【大容量・30枚入り】子供用 ディズニー くまのプーさんマスク', 'k_box_other11.jpg', 'null', 100, 900, '小さめ', '不織布', '大容量', default);
insert into product_table values(null, 1, '【大容量・50枚入り】子供用 不織布マスク ホワイト', 'k_box_white3.jpg', 'null', 100, 520, '小さめ', '不織布', '大容量', default);
insert into product_table values(null, 11, '【個別包装・10枚入り】子供用 KF94マスク ピンク', 'k_package_pink1.jpg', 'null', 100, 230, '小さめ', '不織布', '個別包装', default);
insert into product_table values(null, 17, '【大容量・30枚入り】子供用 ディズニー ミッキーマスク', 'k_box_other13.jpg', 'null', 100, 910, '小さめ', '不織布', '大容量', default);
insert into product_table values(null, 1, '【大容量・50枚入り】子供用 三層衛生マスク ホワイト', 'k_box_white1.jpg', 'null', 100, 490, '小さめ', '不織布', '大容量', default);
insert into product_table values(null, 4, '【個別包装・2枚入り】子供用 布マスク グリーン', 'k_package_green1.jpg', 'null', 100, 140, '小さめ', '布', '個別包装', default);
insert into product_table values(null, 7, '【個別包装・2枚入り】子供用 布マスク オレンジ', 'k_package_orange1.jpg', 'null', 100, 140, '小さめ', '布', '個別包装', default);
insert into product_table values(null, 17, '【個別包装・5枚入り】子供用 マイメロディ 不織布マスク', 'k_package_other1.jpg', 'null', 100, 120, '小さめ', '不織布', '個別包装', default);
insert into product_table values(null, 17, '【個別包装・5枚入り】子供用 三次元 トイ・ストーリー マスク', 'k_package_other2.jpg', 'null', 100, 150, '小さめ', '不織布', '個別包装', default);
insert into product_table values(null, 17, '【個別包装・10枚入り】子供用 N95 恐竜マスク', 'k_package_other3.jpg', 'null', 100, 230, '小さめ', '不織布', '個別包装', default);
insert into product_table values(null, 15, '【個別包装・6枚入り】子供用 立体マスク パステルグリーン', 'k_package_pastelgreen1.jpg', 'null', 100, 130, '小さめ', '不織布', '個別包装', default);

insert into point_reward_table values(null, 'マスクケース', 'MaskCase.jpg', '2つのポケットで使用中と未使用のマスクを分けて収納できます。・適応サイズ　大人用マスク 幅18㎝まで・外形寸法（広げた状態）幅210×奥行245×厚さ3（ｍｍ）（閉じた状態）幅210×奥行120×厚さ6-8（ｍｍ）', 100, 10);
insert into point_reward_table values(null, 'マスク保管ケース', 'MaskStorageCase.jpg', '玄関に、リビングに、様々なところで使えるマスク保管ケース・サイズ21.4×11.5×10.5・商品重量　233グラム・容量　約1.85L、抗菌、マスク収納可能枚数:約50枚', 100, 20);
insert into point_reward_table values(null, 'マスクケース', 'MaskCase2.jpg', 'フタ付きケースでマスクを清潔に携帯できます。小物の持ち運びにも。・本体サイズ　W251mm×D2mm×H123mm・本体重量　18g・最大収容サイズ　プリーツ型マスクW175mm×D8mm×H95mm・収容枚数　各ポケットに1枚(合計2枚)', 100, 10);
insert into point_reward_table values(null, 'フェイスシールド', 'FaceShield.jpg', '研磨、研削作業において顔面全体を飛来物から保護します。曇り止め加工、マジックテープバンド固定・重さ　144g', 100, 15);
insert into point_reward_table values(null, 'ファッションマスクストラップ 首掛け', 'MaskStrap.jpg', 'マスクケースが不要になる便利アクセサリー', 100, 10);
insert into point_reward_table values(null, '半透明マスク', 'TranslucentMask.jpg', '表情がはっきり見えるので、飲食店、小売店での接客対応、美容室やエステ、物流業界など様々な場所で活躍します。大人用、男女兼用サイズ', 100, 15);
insert into point_reward_table values(null, 'マスクバンド', 'MaskBand.jpg', 'マスクのゴムを両端に引っ掛け、後頭部で支えます。ゴムを耳に掛けないので、長時間つけていても耳が痛くなりません。', 100, 5);
insert into point_reward_table values(null, 'マスクバンド', 'MaskBand2.jpg', 'マスク使用時の不快感や耳の痛みを画期的に解決できるアイテムです。・材質　ゴム・重さ　約5グラム/本、長さ　約50cm。', 100, 5);
insert into point_reward_table values(null, 'マスクケース', 'MaskCase3.jpg', '制菌加工を施したマスクケースマスクをケースで挟み、ゴムを留めるだけ一時的にマスクを外して清潔に保管したい時に便利なアイテム・サイズ　縦8 横10 cm　広げた時 縦16 横21 cm', 100, 10);
insert into point_reward_table values(null, 'マスク用インナーフレーム', 'InnerFrame.jpg', '様々なマスク顔の間に挟み込むように使用する事で、マスク装着時の不快感を軽減するための商品・商品寸法：約100ｍｍ×85ｍｍ×厚さ40ｍｍ・素材：ポリエチレン', 100, 10);

UPDATE product_table set product_image='package_pastelgreen.jpg' where product_id='36';
UPDATE product_table set product_image='k_box_other7.jpg' where product_id='54';

update product_table set size = 'キッズ' where product_id = 44;
update product_table set size = 'キッズ' where product_id = 45;
update product_table set size = 'キッズ' where product_id = 46;
update product_table set size = 'キッズ' where product_id = 47;
update product_table set size = 'キッズ' where product_id = 48;
update product_table set size = 'キッズ' where product_id = 48;
update product_table set size = 'キッズ' where product_id = 49;
update product_table set size = 'キッズ' where product_id = 50;
update product_table set size = 'キッズ' where product_id = 51;
update product_table set size = 'キッズ' where product_id = 52;
update product_table set size = 'キッズ' where product_id = 53;
update product_table set size = 'キッズ' where product_id = 54;
update product_table set size = 'キッズ' where product_id = 55;
update product_table set size = 'キッズ' where product_id = 56;
update product_table set size = 'キッズ' where product_id = 57;
update product_table set size = 'キッズ' where product_id = 58;
update product_table set size = 'キッズ' where product_id = 59;
update product_table set size = 'キッズ' where product_id = 60;
update product_table set size = 'キッズ' where product_id = 61;
update product_table set size = 'キッズ' where product_id = 62;
update product_table set size = 'キッズ' where product_id = 63;
update product_table set size = 'キッズ' where product_id = 64;
update product_table set size = 'キッズ' where product_id = 65;
update product_table set size = 'キッズ' where product_id = 66;
update product_table set size = 'キッズ' where product_id = 67;
update product_table set size = 'キッズ' where product_id = 68;

UPDATE product_table set product_image='package_biege1_1.jpg' where product_id='12';
UPDATE product_table set product_image='package_blue3_1.jpg' where product_id='16';
UPDATE product_table set product_image='package_green1_1.jpg' where product_id='18';
UPDATE product_table set product_image='package_khaki1_1.jpg' where product_id='31';
UPDATE product_table set product_image='package_pink2_1.jpg' where product_id='21';

update point_reward_table set point_price=70 where reward_product_image='MaskCase.jpg';
update point_reward_table set point_price=350 where reward_product_image='MaskStorageCase.jpg';
update point_reward_table set point_price=70 where reward_product_image='MaskCase2.jpg';
update point_reward_table set point_price=130 where reward_product_image='FaceShield.jpg';
update point_reward_table set point_price=50 where reward_product_image='MaskStrap.jpg';
update point_reward_table set point_price=70 where reward_product_image='TranslucentMask.jpg';
update point_reward_table set point_price=50 where reward_product_image='MaskBand.jpg';
update point_reward_table set point_price=50 where reward_product_image='MaskBand2.jpg';
update point_reward_table set point_price=70 where reward_product_image='MaskCase3.jpg';
update point_reward_table set point_price=80 where reward_product_image='InnerFrame.jpg';

update product_table p join color_table c using(color_id) set product_description=concat('色：',c.color_name,'、サイズ：',size,'、素材：',material,'、包装タイプ：',packing_type);
</pre>
