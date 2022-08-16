class Api::V1::CartListsController < ApplicationController
  before_action :authenticate_user!

  def index
    user_cart = current_user.carts.includes([:cart_lists])
    category_items_count = { category: {}, items: {} }
    user_cart.each do |cart|
      group_items = cart.cart_lists.group(:product_name).count
      group_category = cart.cart_lists.group(:product_category).count
      category_items_count[:items] = group_items
      category_items_count[:category] = group_category
    end
    render json: {
      data: category_items_count,
      status: 200
    }
  end

  def create
    cart = current_user.carts.find_by(active: true)
    if cart
      find_existing_item = cart.cart_lists.where(product_name: new_list_params[:product_name],
        product_category: new_list_params[:product_category])
      if find_existing_item.count.positive?
        render json: {
          message: 'Item already exists in cart',
          status: 400
        }
      else
        new_cart_list = cart.cart_lists.create(new_list_params)
        save_item(new_cart_list)
      end
    else
      new_cart = current_user.carts.create!(name: '')
      new_cart_list = new_cart.cart_lists.create(new_list_params)
      save_item(new_cart_list)
    end
    
  end

  def save_item(new_item)
    if new_item.save
      render json: {
        data: new_item.as_json(only: %i[id product_category product_name quantity unit]),
        cart_id: new_item.cart_id, 
        status: 201
      }
    else
      render json: {
        message: 'Cart Item created unsuccesfully',
        status: 400
      }
    end
  end

  # def group_keys(object, item)
  #   object.collect do |key, value|
  #     if item.key?(key.name)
  #       item[key.name] += value
  #     else
  #       item[key.name] = value
  #     end
  #   end
  # end

  private

  def new_list_params
    params.require(:new_cart_list).permit(:product_name, :product_category, :measurement_unit, :quantity)
  end
end
