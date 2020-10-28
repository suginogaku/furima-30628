## usersテーブル

|Column|Type|Options|
|------|----|-------|
| nickname | string | null: false |
| email | string | unique: true |
| encrypted_password | string | null: false|
| first_name | string | null: false |
| last_name  | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana | string | null: false |
| birthday   | date | null: false |

### Association
- has_many :items
- has_many :purchases


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
| item_name | string | null: false |
| item_explain | text | null: false |
| item_category_id | integer | null: false |
| item_status_id | integer | null: false |
| item_burden_id | integer | null: false |
| item_prefecture_id | integer | null: false |
| item_day_id | integer | null: false |
| item_price | integer | null: false |
| user | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase


## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
| user | references | foreign_key: true |
| item | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
| postcode | string | null: false |
| prefecture_id | integer | null: false |
| city | string | null: false |
| block | string | null: false |
| building | string |
| phone_number | string | null: false |
| purchase | references | foreign_key: true |

### Association
- belongs_to purchase
