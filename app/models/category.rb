class Category < ApplicationRecord
  has_many :item_categories, class_name: 'ItemCategory', foreign_key: 'category_id', dependent: :destroy
  has_many :cart_lists, class_name: 'CartList', foreign_key: 'category_id', dependent: :destroy
  has_many :items, through: :item_categories, dependent: :destroy

  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  def get_category_count(data_object, cart_id)
    count_category = cart_lists.where(cart_id: cart_id).count
    category = data_object[:category]

    if category.key?(name)
      category[name] += count_category
    else
      category[name] = count_category
    end
  end
end
