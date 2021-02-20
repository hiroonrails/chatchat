# テーブル設計

## usersテーブル

| Column   | Type        | Options     |
| -------- | ----------- | ----------- |
| name     | string      | null: false |
| email    | string      | null: false |
| password | string      | null: false |

### Association
- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages

## roomsテーブル
<!-- null:false -->

| Column   | Type        | Options     |
| -------- | ----------- | ----------- |
| name     | string      | null: false |

### Association
- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages

## room_usersテーブル
<!--referencesは外部から参照するという意味、room_id と user_idではなかろうか -->

| Column   | Type        | Options                        |
| -------- | ----------- | ------------------------------ |
| user     | references  | null: false, foreign_key: true |
| room     | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :room

## messagesテーブル

| Column   | Type        | Options                        |
| -------- | ----------- | ------------------------------ |
| content  | string      |                                |
| user     | references  | null: false, foreign_key: true |
| room     | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :room