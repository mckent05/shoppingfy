class AddDetailsToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :name, :string
    add_column :items, :description, :string
    add_column :items, :image, :string
    add_column :items, :measurement_unit, :string
    add_column :items, :quantity, :integer
  end
end
