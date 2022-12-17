class Api::V1::CartsController < ApplicationController
  before_action :authenticate_user!

  def index
    cart = current_user.carts.where(active: false).order(:created_at).reverse_order
    render json: {
      data: cart,
      status: 200
    }, status: :ok
  end

  def show
    my_cart = Cart.find(params[:id])
    categories = Category.all
    data = []
    categories.each do |cat|
      cat_items = []
      filtered_list = my_cart.cart_lists.where(product_category: cat.name)
      next unless filtered_list.count.positive?

      filtered_list.each do |list|
        cat_items << list.as_json(only: %i[product_name quantity measurement_unit id])
      end
      data << { category: cat, items: cat_items }
    end
    render json: {
      data: { cartName: my_cart.as_json(only: %i[name created_at status]), cartDetails: data },
      status: 200
    }, status: :ok
  end

  def update
    existing_cart = current_user.carts.find_by(active: true)
    existing_cart.update(update_cart)
    render json: {
      data: existing_cart.as_json(only: %i[name id]),
      message: 'saved'
    }, status: :ok
  end
end

private

def update_cart
  params.require(:update_cart).permit(:active, :status, :name)
end
