class CartList < ApplicationRecord
    belongs_to :item, class_name: "Item", foreign_key: "item_id"
    belongs_to :category, class_name: "Category", foreign_key: "category_id"
    belongs_to :cart, class_name: "Cart", foreign_key: "cart_id"
end
