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

|Column                       |Type  |Options            |
|-----------------------------|------|-------------------|
|nickname (ユーザー名)          |string|null: false        |
|encrypted_password (パスワード)|string|null: false        |
|email (メールアドレス)          |string|null: false, unique|
|address (住所)                |text  |null: false        |
|profile (プロフィール)         |text  |null: false        |

###　アソシエーション
- has_many :items
- has_many :favorites


## Favoriteテーブル
|Column             |Type               |Options                       |
|favorite(お気に入り) |references         |foreign_key: true             |

### アソシエーション
- belongs_to user
- belong_to :item


## itemsテーブル(商品情報)

|Column             |Type               |Options                       |
|-------------------|-------------------|------------------------------|
|title (商品名)      |string             |null: false                   |
|detail(商品の詳細)   |text               |null: false                   |
|price (商品の価格)   |string             |null: false                   |
|image (商品の画像)   |string             |null: false                   |
|seller(出品者)      |references         |null: false, foreign_key: true|

###　アソシエーション
- has_many :users
- has_one :purchase
- has_one :delivery
- has_many :favorites

## purchaseテーブル(購入記録)

|Column       |Type      |Options                       |
|-------------|----------|------------------------------|
|buyer (買い手)|references|null: false, foreign_key: true|


###　アソシエーション
- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliveriesテーブル(発送先情報)

|Column                  |Type|Options    |
|------------------------|----|-----------|
|delivery_address (配送先)|text|null: false|


###　アソシエーション
- belongs_to :user
- belongs_to :item
- belongs_to :purchase