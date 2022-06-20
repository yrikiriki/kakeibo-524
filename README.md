# アプリケーション名
Share Shopping

# アプリケーション概要
自分の買ったものを投稿、安いものや良い商品をみんなに共有することができる。
また、マイページでは、家計簿をつけることができる

# URL
https://shopping-share-524.herokuapp.com/

# テスト用アカウント
・Basic認証パスワード：0524
・Bsic認証ID：riki
・メールアドレス：riki@com
・パスワード：riki0524

# 利用方法

## 買い物投稿
1.トップページ（一覧ページ）のヘッダーからユーザー新規登録を行う
2.画面右下のShareボタンから、新規投稿内容(タイトル・買い物内容・ひとこと・店名・カテゴリー)を入力し投稿する

## 家計簿をつける
1.トップページ（一覧ページ）のヘッダーからユーザー名をクリックし、ユーザーページに遷移する
2.今月の収入が入力されてない場合は、[クリックして入力]という文字が出るのでクリックして入力する
3.カレンダーの買った日の日付をクリックし、記録する日付を選択し、保存する
4.保存した日に詳細ボタンができるため、詳細ボタンをクリックし、買ったものを記録する

# アプリケーションを作成した背景

BtoC向けの売れるアプリケーションを作りたいと思い、日頃からアプリケーションの使用頻度の高いと予想される主婦層向けのアプリケーションを作成したいと思いました。
また、家計簿アプリにSNSを機能をつけた理由としては、自分自身がスーパーに行った際に、野菜の相場が分からなく、安いのか高いのか判断ができなかったため、日頃からSNSで他人の買い物を把握することで野菜などの相場感が身につくと思い、家計簿兼SNSアプリの作成をすることにしました。

# 実装予定の機能

・フォロー機能・いいね機能・相場検索機能・画像投稿機能・地域検索

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/f0b3c93b2c627163d2134060b0868183.png)](https://gyazo.com/f0b3c93b2c627163d2134060b0868183)
# テーブル設計

##  usersテーブル
has_many :items
has_many :records

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| nickname           | string  | null: false               |
| encrypted_password | string  | null: false               |
| prefecture_is      | integer | null: false               |
| city               | string  | null: false               |




##  buysテーブル
belongs_to :user
has_one :record

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| month_id              | integer    | null: false                    |
| day_id                | integer    | null: false                    |
| category_id           | integer    | null: false                    |
| item_name             | string     | null: false                    |
| user                  | references | null: false, foreign_key: true |



##  badgetsテーブル
belongs_to :record

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| month_id              | integer    | null: false                    |
| income                | integer    | null: false                    |
| spending              | integer    | null: false                    |
| balance               | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |
| buy                   | references | null: false, foreign_key: true |

##  commentsテーブル
belongs_to :user
belongs_to :item
has_one :address

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| post               | references | null: false, foreign_key: true |
| text               | string     | null: false                    |

##  postsテーブル
belongs_to :user
has_one :record

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| title                 | string     | null: false                    |
| content               | string     | null: false                    |
| text                  | string     |                                |
| store_name            | string     |                                |
| category_id           | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |
| item                  | references | null: false, foreign_key: true |