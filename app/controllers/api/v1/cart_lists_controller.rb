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
      existing_item = cart.cart_lists.where(product_name: new_list_params[:product_name],
                                            product_category: new_list_params[:product_category])
      if existing_item.count.positive?
        render json: {
          data: existing_item.as_json(only: %i[id product_category product_name quantity unit cart_id]),
          message: 'Item added to cart',
          status: 201
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
        data: new_item.as_json(only: %i[id product_category product_name quantity unit cart_d]),
        message: 'Item added to cart',
        status: 201
      }
    else
      render json: {
        message: 'Cart Item created unsuccesfully',
        status: 400
      }
    end
  end

  def update
    item = CartList.find(params[:id])
    item.update(updated_params)
    render json: {
      message: 'saved',
      status: 201,

    }
  end

  def destroy
    item = CartList.find(params[:id])
    if item.destroy
      render json: {
        message: 'Item deleted',
        status: 200
      }
    else
      render json: {
        message: 'Error Deleting Item',
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

  def update_params
    params.require(:updated_cart_list).permit(:quantity)
  end

end
