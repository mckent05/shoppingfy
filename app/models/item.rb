class Item < ApplicationRecord
  has_many :item_categories, class_name: 'ItemCategory', foreign_key: 'item_id', dependent: :destroy
  has_many :cart_lists, class_name: 'CartList', foreign_key: 'item_id', dependent: :destroy
  has_many :categories, through: :item_categories, dependent: :destroy

  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  def get_items_count(data_object, cart_id)
    count_item = cart_lists.where(cart_id: cart_id).count
    item = data_object[:items]

    if item.key?(name)
      item[name] += count_item
    else
      item[name] = count_item
    end
  end
end
