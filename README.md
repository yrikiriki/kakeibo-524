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




#  buysテーブル
belongs_to :user
has_one :record

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| month_id              | integer    | null: false                    |
| day_id                | integer    | null: false                    |
| category_id           | integer    | null: false                    |
| item_name             | string     | null: false                    |
| user                  | references | null: false, foreign_key: true |



#  badgetsテーブル
belongs_to :record

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| month_id              | integer    | null: false                    |
| income                | integer    | null: false                    |
| spending              | integer    | null: false                    |
| balance               | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |
| buy                   | references | null: false, foreign_key: true |

#  commentsテーブル
belongs_to :user
belongs_to :item
has_one :address

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| post               | references | null: false, foreign_key: true |
| text               | string     | null: false                    |

#  postsテーブル
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