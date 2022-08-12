class CartList < ApplicationRecord
  belongs_to :cart, class_name: 'Cart', foreign_key: 'cart_id'
end
