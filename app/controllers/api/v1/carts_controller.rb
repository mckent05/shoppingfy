class Api::V1::CartsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: %i[create]

  def index
    cart = current_user.carts.order(:created_at).reverse_order
    render json: {
      data: cart,
      status: 200
    }
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
        cat_items << list.as_json(only: %i[product_name measurement_unit id])
      end
      data << { category: cat, items: cat_items }
    end
    render json: {
      data: data,
      status: 200
    }
  end

  # def create
  #   existing_cart = current_user.carts.find_by(active: true)
  #   render json: {
  #     data: existing_cart.as_json(only: %i[id name]),
  #     status: 200
  #   }
  #   if existing_cart
  #     render json: {
  #       data: existing_cart.as_json(only: %i[id name]),
  #       status: 200
  #     }
  #   else
  #     cart = current_user.carts.create(new_cart_details)
  #     render json: {
  #       data: cart.as_json(only: %i[id name]),
  #       status: 200
  #     }
  #   end
  # end

  def update
    existing_cart = current_user.carts.find_by(active: true)
    existing_cart.update(update_cart)
    render json: {
      data: existing_cart.as_json(only: %i[name id]),
      message: 'saved'
    }
  end
end

private

# def new_cart_details
#   params.require(:new_cart).permit(:name)
# end

def update_cart
  params.require(:update_cart).permit(:active, :status, :name)
end
