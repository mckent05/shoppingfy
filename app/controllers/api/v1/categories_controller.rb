class Api::V1::CategoriesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    all_categories = Category.all
    categories = all_categories.as_json(only: %i[id name])
    render json: {
      data: categories,
      status: 200
    }, status: :ok
  end
end
