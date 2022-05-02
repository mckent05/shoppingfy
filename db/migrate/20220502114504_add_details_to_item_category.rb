class AddDetailsToItemCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :item_categories, :quantity, :integer, :default => 1
    add_reference :item_categories, :item, null: false, foreign_key: true
    add_reference :item_categories, :category, null: false, foreign_key: true
  end
end
