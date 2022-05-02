class AddDetailsToCart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :name, :string
  end
end
