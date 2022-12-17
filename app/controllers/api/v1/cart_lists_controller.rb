class Api::V1::CartListsController < ApplicationController
  before_action :authenticate_user!

  def index
    user_cart = current_user.carts.where(active: false).includes([:cart_lists])
    category_items_count = { category: {}, items: {}, created_at: {}, total: 0 }
    user_cart.each do |cart|
      category_items_count[:total] += cart.cart_lists.count
      group_items = cart.cart_lists.group(:product_name).count
      group_category = cart.cart_lists.group(:product_category).count
      group_created_at = cart.cart_lists.group_by { |t| t.created_at.strftime('%B') }
      items = category_items_count[:items]
      category = category_items_count[:category]
      created_at = category_items_count[:created_at]

      group_keys(group_items, items)
      group_keys(group_category, category)
      group_keys2(group_created_at, created_at)
    end
    render json: {
      data: category_items_count,
      status: 200
    }, status: :ok
  end

  def create
    cart = current_user.carts.find_by(active: true)
    if cart
      existing_item = cart.cart_lists.find_by(product_name: new_list_params[:product_name],
                                              product_category: new_list_params[:product_category])
      if existing_item
        render json: {
          data: existing_item.as_json(only: %i[id product_category product_name quantity measurement_unit cart_id]),
          message: 'Item added to cart',
          status: 201
        }, status: :created
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
        data: new_item.as_json(only: %i[id product_category product_name quantity measurement_unit cart_id]),
        message: 'Item added to cart',
        status: 201
      }, status: :created
    else
      render json: {
        message: 'Cart Item created unsuccesfully',
        status: 400
      }, status: bad_request
    end
  end

  def update
    item = CartList.find(params[:id])
    item.update(update_params)
    render json: {
      message: 'saved',
      status: 201

    }, status: :created
  end

  def destroy
    item = CartList.find(params[:id])
    if item.destroy
      render json: {
        message: 'Item deleted',
        status: 200
      }, status: :ok
    else
      render json: {
        message: 'Error Deleting Item',
        status: 400
      }, status: :bad_request
    end
  end

  private

  def new_list_params
    params.require(:new_cart_list).permit(:product_name, :product_category, :measurement_unit, :quantity)
  end

  def update_params
    params.require(:updated_cart_list).permit(:quantity)
  end

  def group_keys(object, item)
    object.collect do |key, value|
      if item.key?(key)
        item[key] += value
      else
        item[key] = value
      end
    end
  end

  def group_keys2(object, item)
    object.collect do |key, value|
      if item.key?(key)
        item[key] += value.count
      else
        item[key] = value.count
      end
    end
  end
end
