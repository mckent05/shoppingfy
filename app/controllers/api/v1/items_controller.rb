class Api::V1::ItemsController < ApplicationController
  def destroy
    item = Item.find(params[:id])
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

  def show
    item = Item.find(params[:id])
    render json: {
      data: item.as_json(only: %i[name description image measurement_unit quantity user_id]),
      status: 200
    }
  end
end
