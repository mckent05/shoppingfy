class AddPropsToCartList < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_lists, :measurement_unit, :string
  end
end
