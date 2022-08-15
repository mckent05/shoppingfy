class AddDetailsToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :name, :string
    add_column :items, :description, :string
    add_column :items, :image, :string, :default => 'https://res.cloudinary.com/duj88gras/image/upload/v1660563933/default_nnor2h.png'
    add_column :items, :measurement_unit, :string
    add_column :items, :quantity, :integer
  end
end
