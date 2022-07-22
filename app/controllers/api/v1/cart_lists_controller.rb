class Api::V1::CartListsController < ApplicationController
  before_action :authenticate_user!

  def index
    user_cart = current_user.carts.includes([:cart_lists])
    category_items_count = { category: {}, items: {} }
    user_cart.each do |cart|
      group_items = cart.cart_lists.group(:item).count
      group_category = cart.cart_lists.group(:category).count
      item = category_items_count[:items]
      category = category_items_count[:category]

      group_keys(group_items, item)
      group_keys(group_category, category)
    end
    render json: {
      data: category_items_count,
      status: 200
    }
  end

  def create
    cart = current_user.carts.find_by(active: true)
    new_cart_list = ''
    if cart
      new_cart_list = cart.cart_lists.create(new_list_params)
    else
      new_cart = current_user.carts.create!(name: '', status: '')
      new_cart_list = new_cart.cart_lists.create(new_list_params)
    end
    save_item(new_cart_list)
  end

  def save_item(new_item)
    if new_item.save
      render json: {
        message: 'Cart created succesfully',
        status: 201
      }
    else
      render json: {
        message: 'Cart created unsuccesfully',
        status: 400
      }
    end
  end

  def group_keys(object, item)
    object.collect do |key, value|
        if item.key?(key.name)
            item[key.name] += value
        else
            item[key.name] = value
        end
    end
  end

  private

  def new_list_params
    params.require(:new_cart_list).permit(:category_id, :item_id, :quantity)
  end
end
