class Cart < ApplicationRecord
  has_many :cart_lists, class_name: 'CartList', foreign_key: 'cart_id', dependent: :destroy
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
end
