class User < ApplicationRecord
  has_many :items, class_name: 'Item', foreign_key: 'user_id', dependent: :destroy
  has_many :categories, class_name: 'Category', foreign_key: 'user_id', dependent: :destroy
  has_many :carts, class_name: 'Cart', foreign_key: 'user_id', dependent: :destroy
end
