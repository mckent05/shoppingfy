class Api::V1::ItemCategoryController < ApplicationController
  def create
    exisiting_category = Category.find_by(name: new_item_category[:category])
    new_item = Item.create(new_item_category)
    if exisiting_category.exists?
      new_item_category = exisiting_category.item_categories.create(item: new_item)
    else
      new_category = current_user.categories.create(name: new_item_category[:category])
      new_item_category = new_category.item_categories.create(item: new_item)
    end
    display_message(new_item_category)
  end

  private

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

  def new_item_category
    params.require(:new_item).permit(:category, :name, :image, :description, :measurement_unit, :quantity)
  end
end
