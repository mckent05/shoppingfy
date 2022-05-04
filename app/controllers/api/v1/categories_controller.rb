class Api::V1::CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    all_categories = Category.all
    category_items = []
    all_categories.each do |cat|
      all_items = []
      cat.item_categories.each { |c| all_items << c.item.as_json(only: %i[name measurement_unit quantity]) }
      category_items << { category: cat.name, items: all_items }
    end
    render json: {
      data: category_items,
      status: 200
    }
  end
end
