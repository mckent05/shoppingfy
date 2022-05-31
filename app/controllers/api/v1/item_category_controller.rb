class Api::V1::ItemCategoryController < ApplicationController

  def index
    all_categories = Category.all.includes([:item_categories])
    category_items = []
    all_categories.each do |cat|
      all_items = []
      cat.item_categories.each { |c| all_items << c.item.as_json(only: %i[name description measurement_unit quantity]) }
      category_items << { category: cat.name, items: all_items }
    end
    render json: {
      data: category_items,
      status: 200
    }
  end

  def create
    existing_category = Category.find_by(name: new_item_category[:category_name])
    existing_item = Item.find_by(name: new_item_category[:item_name])
    existing_item_category = ItemCategory.find_by(item: existing_item, category: existing_category, quantity: 1)
    if existing_item
      render json: {
        message: 'Item already exists for this category',
        status: 200
      }
    else
      new_item = current_user.items.create(name: new_item_category[:item_name], description: new_item_category[:description], image: new_item_category[:image], quantity: new_item_category[:quantity])
      new_category = current_user.categories.create(name: new_item_category[:category_name])
      if existing_category
        new_item_category = existing_category.item_categories.create(item: new_item)
      else
        new_item_category = new_category.item_categories.create(item: new_item)  
      end
      display_message(new_item_category)
    end
  end

  def display_message(item)
    if item.save
      render json: {
        message: 'Item created succesfully',
        status: 200
      }
    else
      render json: {
        message: 'Error Creating this item',
        status: 400
      }
    end
  end

  private
  def new_item_category
    params.require(:new_item).permit(:category_name, :item_name, :image, :description, :measurement_unit, :quantity)
  end
end
