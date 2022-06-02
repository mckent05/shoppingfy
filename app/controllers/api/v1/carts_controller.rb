class Api::V1::CartsController < ApplicationController
  def index
    cart = current_user.carts
    render json: {
      data: cart,
      status: 200
    }
  end
end
