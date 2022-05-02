class CreateCartLists < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_lists do |t|

      t.timestamps
    end
  end
end
