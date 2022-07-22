class Api::V1::CartListsController < ApplicationController
  before_action :authenticate_user!

  def index
    user_cart = current_user.carts
    tope = { category: {}, items: {} }
    user_cart.each do |cart|
      Item.all.each do |item|
        item.get_items_count(tope, cart.id)
      end
      Category.all.each do |category|
        category.get_category_count(tope, cart.id)
      end
    end
    render json: {
      data: tope,
      status: 200
    }
  end

  def create
    cart = curret_user.carts.find_by(active: true)
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

  private

  def new_list_params
    params.require(:new_cart_list).permit(:category_id, :item_id, :quantity)
  end
end
