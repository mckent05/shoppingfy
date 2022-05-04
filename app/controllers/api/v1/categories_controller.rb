class Api::V1::CategoriesController < ApplicationController
  def index
    all_categories = Category.all
    category_items = []
    all_categories.each do |cat|
      all_items = []
      cat.item_categories.each { |c| items << c.item.as_json(only: %i[name measurement_unit quantity]) }
      category_items << { category: cat, items: all_items }
    end
    render json: {
      data: category_items,
      status: 200
    }
  end
end
