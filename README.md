## usersテーブル

|Column|Type|Options|
|------|----|-------|
| nickname | string | null: false |
| email | string | unique: true |
| password   | string | null: false |
| password_conformation | string | null: false |
| first_name | string | null: false |
| last_name  | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana | string | null: false |
| birthday   | integer | null: false |

### Association
- has_many :items
- has_many :purchases


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
| item_name | string | null: false |
| item_explain | text | null: false |
| item_price | integer | null: false |
| user_id | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase


## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
| user_id | references | foreign_key: true |
| item_id | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
| postcode | integer | null: false |
| city | string | null: false |
| block | string | null: false |
| building | string |
| phone_number | integer | null: false |
| purchase_id | references | foreign_key: true |

### Association
- belongs_to purchase
