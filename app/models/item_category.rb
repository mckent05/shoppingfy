class ItemCategory < ApplicationRecord
    belongs_to :item, class_name: "Item", foreign_key: "item_id", dependent: :destroy
    belongs_to :category, class_name: "Category", foreign_key: "category_id", dependent: :destroy
end
