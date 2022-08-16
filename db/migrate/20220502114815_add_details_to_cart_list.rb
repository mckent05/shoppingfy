class AddDetailsToCartList < ActiveRecord::Migration[7.0]
  def change
    add_reference :cart_lists, :item, null: false, foreign_key: true
    add_reference :cart_lists, :category, null: false, foreign_key: true
    add_reference :cart_lists, :cart, null: false, foreign_key: true
    add_column :cart_lists, :quantity, :integer, :default => 1
  end
end