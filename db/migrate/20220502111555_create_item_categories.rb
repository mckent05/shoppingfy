class CreateItemCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :item_categories do |t|

      t.timestamps
    end
  end
end
