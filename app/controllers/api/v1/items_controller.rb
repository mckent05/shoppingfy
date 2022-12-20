class Api::V1::ItemsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: %i[destroy]

  def destroy
    item = Item.find(params[:id])
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
end
