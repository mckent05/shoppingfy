class AddPropertiesToCartList < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_lists, :product_name, :string
    add_column :cart_lists, :product_category, :string
  end
end
