class Api::V1::CartsController < ApplicationController
  def index
    cart = current_user.carts
    render json: {
      data: cart,
      status: 200
    }
  end

  def show
    my_cart = Carts.find(params[:id])
    categories = Categories.all
    data = []
    categories.each do |cat|
      cat_items = []
      filtered_list = my_cart.cart_list.where(category_id: cat.id)
      next unless filtered_list.positive?

      filtered_list.each do |list|
        cat_items << list.item.as_json(only: %i[name quantity measurement_unit])
      end
      data << { category: cat, items: cat_items }
    end
  end
  render json: {
    data: data,
    status: 200
  }
end
