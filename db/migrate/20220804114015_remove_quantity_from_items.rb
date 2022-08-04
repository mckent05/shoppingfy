class RemoveQuantityFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :quantity, :integer
  end
end
