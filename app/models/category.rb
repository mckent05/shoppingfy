class Category < ApplicationRecord
  has_many :item_categories, class_name: 'ItemCategory', foreign_key: 'category_id', dependent: :destroy
  has_many :items, through: :item_categories, dependent: :destroy

  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
end
