class Api::V1::CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    all_categories = Category.all
    all_categories = all_categories.as_json(only: %i[name])
    render json: {
      data: all_categories,
      status: 200
    }
  end
end
