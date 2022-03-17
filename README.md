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
|encrypted_password (パスワード)|string |null: false              |
|email (メールアドレス)          |string |null: false, unique: true|
|last_name(苗字)               |string |null: false              |
|last_kana(苗字カナ)            |strin  |null: false              |
|first_name(名前)              |string |null: false              |
|first_kana(名前カナ)           |string |null: false              |
|birthday(誕生日)               |integer|null: false             |
|seller(出品者)                 |references|foreign_key: true    |

###　アソシエーション
- has_many :items


## itemsテーブル(商品情報)

|Column             |Type               |Options                       |
|-------------------|-------------------|------------------------------|
|title (商品名)      |string             |null: false                   |
|price (商品の価格)   |integer            |null: false                   |
|seller(出品者)      |references         |null: false, foreign_key: true|
|category(カテゴリー) |string             |null: false                   |
|condition(商品の状態)|string             |null: false                   |
|charge(配送料の負担) |string             |null: false                   |
|source(発送元の地域) |string             |null: false                   |
|date(発送日の目安)   |string             |null: false                   |

###　アソシエーション
- has_one :users
- has_one :purchase

## purchaseテーブル(購入記録)

|Column              |Type      |Options                       |
|--------------------|----------|------------------------------|
|buyer (買い手)       |references|null: false, foreign_key: true|
|purchase_item(購入物)|references|null: false, foreign_key: true| 

###　アソシエーション
- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliveriesテーブル(発送先情報)

|Column                  |Type|Options    |
|------------------------|----|-----------|
|post_address(郵便番号)    |string|null: false|
|municipality(市区町村)    |string|null: false|
|address(番地)            |string|null: false|
|building(建物名)         |string|null: false|
|phone_number(電話番号)   |integer| null: false|

###　アソシエーション
- belongs_to :purchase