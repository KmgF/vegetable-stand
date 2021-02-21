# README

# Usersテーブル
|Column               | Type   | Option|
----------------------|---------|----------
|nickname             | string | null false|
|email                | string | null false|
|encrypted_password   | string | null false|
|postal_number        | string | null false|
|first_name           | string | null false|
|family_name          | string | null false|
|first_name_kana      | string | null false|
|family_name_kana     | string | null false|
|seller_or_buyer      | integer| null false|
|delivery_method_id   | integer | null false|
|pay_method_id        | integer | null false|


## Association
- has_many :stands
- has_many :vegetables


# Stands テーブル
|Column            | Type   | Option|
-------------------|---------|-------------
|user_id           | integer | null false|
|street_address    | string  | null false|
|vegetable_id      | integer | null false|

## Association
- belongs_to :user
- has_many :vegetables

# Vegetables テーブル
|Column              | Type   | Option|
---------------------|---------|-------------
|category            | string  | null false|
|price               | integer | null false |
|user_id             | integer | null false ,foreign_key true|
|origin              | string  | null false|
|shipment_service    | integer | null false|
|delivery_fee        | string  |
|quality             | integer | null false|
|quality_description | text    |   
|amount              | integer | null false|
|important_notice    | text    |
|message             | text    |
|sale_or_soldout     | integer |

## Association
belongs_to :user
belongs_to :stand
has_one :buyer

# Buyers テーブル
|Column              | Type   | Option|
--------------------|---------|--------------
|user_id             | integer | null false|
|vegetable_id        | integer | null false|
|delivery_method_id  | integer | null false|
|addresses_id        | integer | 
|pay_method_id       | integer | null false|

## Association
belongs_to :vegetable
has_one :address

# Addresses テーブル
|Column          | Type   | Option|
-----------------|---------|-----------------
|postal_number   | string  | null false |  
|prefecture      | integer | null false|
|city            | string  | null false|
|house_number    | string  | null false|
|building_name   | string  | null false |
|tel             | string  | null false|

## Association
belongs_to :buyer