class Api::V1::ApiController < ApplicationController
  def error
    render json: { message: 'Wrong endpoint', status: 400 }
  end
end
