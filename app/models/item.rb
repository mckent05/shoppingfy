class Item < ApplicationRecord
  has_many :item_categories, class_name: 'ItemCategory', foreign_key: 'item_id', dependent: :destroy
  has_many :categories, through: :item_categories, dependent: :destroy

  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
end
