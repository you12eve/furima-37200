# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# データベース設計


## usersテーブル(ユーザー情報)

|Column                       |Type   |Options                  |
|-----------------------------|-------|-------------------------|
|nickname                     |string |null: false              |
|encrypted_ password (パスワード)|string |null: false              |
|email (メールアドレス)          |string |null: false, unique: true|
|last_name(苗字)               |string |null: false              |
|last_kana(苗字カナ)            |string |null: false              |
|first_name(名前)              |string |null: false              |
|first_kana(名前カナ)           |string |null: false              |
|birthday(誕生日)               |date  |null: false             |

###　アソシエーション
- has_many :items
- has_many :purchases


## itemsテーブル(商品情報)

|Column                         |Type               |Options                       |
|-------------------------------|-------------------|------------------------------|
|title (商品名)                  |string             |null: false                   |
|description(商品説明)            |text               |null: false                  |
|price (商品の価格)               |integer            |null: false                   |
|user(出品者)                    |references         |null: false, foreign_key: true|
|category_id(カテゴリー)          |integer            |null: false                   |
|condition_id(商品の状態)         |integer            |null: false                   |
|charge_id(配送料の負担)          |integer            |null: false                   |
|source_id(発送元の地域)          |integer            |null: false                   |
|scheduled_day_id(発送日の目安)   |integer            |null: false                   |

###　アソシエーション
- belongs_to :user
- has_one :purchase


## purchaseテーブル(購入記録)

|Column              |Type      |Options                       |
|--------------------|----------|------------------------------|
|user (買い手)        |references|null: false, foreign_key: true|
|item(購入物)         |references|null: false, foreign_key: true| 

###　アソシエーション
- belongs_to :user
- belongs_to :item
- has_one :delivery


## deliveriesテーブル(発送先情報)

|Column                  |Type  |Options                       |
|------------------------|------|------------------------------|
|post_address(郵便番号)   |string|null: false                   |
|source_id(都道府県)      |integer|null: false                  |
|municipality(市区町村)   |string|null: false                   |
|address(番地)            |string|null: false                  |
|building(建物名)         |string|                              |
|phone_number(電話番号)   |string| null: false                  |
|purchase(購入記録)       |string|null: false, foreign_key: true|

###　アソシエーション
- belongs_to :purchase