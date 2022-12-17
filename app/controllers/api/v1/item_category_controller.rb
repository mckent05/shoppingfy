class Api::V1::ItemCategoryController < ApplicationController
  def index
    all_categories = Category.all.includes([:item_categories])
    category_items = []
    all_categories.each do |cat|
      all_items = []
      cat.item_categories.map do |c|
        all_items << c.item.as_json(only: %i[name id measurement_unit])
      end
      category_items << { category: cat.as_json(only: %i[id name]), items: all_items }
    end
    render json: {
      data: category_items,
      status: 200
    }, status: :ok
  end

  def show
    item_category = ItemCategory.find_by(item_id: params[:id])
    render json: {
      data: { cat_name: item_category.category.name,
              item_details: item_category.item.as_json(only: %i[name id description image measurement_unit]) }
    }
  end

  def create
    existing_category = Category.find_by(name: params[:category_name])
    existing_item = Item.find_by(name: new_item_params[:name])
    if existing_item
      if existing_category
        existing_item_category = ItemCategory.find_by(item_id: existing_item.id, category_id: existing_category.id)
        if existing_item_category
          render json: {
            message: 'Item already exists for this category',
            status: 409
          }, status: :conflict
        else
          existing_item = current_user.items.create(new_item_params)
          item_category = ItemCategory.create(item_id: existing_item.id, category_id: existing_category.id)
          display_message(item_category)
        end
      else
        new_category = current_user.categories.create(params[:category_name])
        item_category = new_category.item_categories.create(item: existing_item)
        display_message(item_category)
      end
    else
      new_item = current_user.items.create(new_item_params)
      if existing_category
        item_category = existing_category.item_categories.new(item: new_item)
      else
        new_category = current_user.categories.create(name: params[:category_name])
        item_category = new_category.item_categories.new(item: new_item)
      end
      display_message(item_category)
    end
  end

  def display_message(item)
    if item.save
      render json: {
        message: 'Item created succesfully',
        status: 201,
        data: { category: item.category.as_json(only: %i[id name]),
                items: item.item.as_json(only: %i[name id measurement_unit]) }
      }, status: :created
    else
      render json: {
        message: 'Error Creating this item',
        status: 400
      }, status: :bad_request
    end
  end

  private

  def new_item_params
    params.require(:new_item).permit(:name, :description, :image, :measurement_unit)
  end
end
