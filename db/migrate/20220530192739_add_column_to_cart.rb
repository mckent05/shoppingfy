class AddColumnToCart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :active, :boolean, :default => true
    add_column :carts, :status, :string
  end
end
