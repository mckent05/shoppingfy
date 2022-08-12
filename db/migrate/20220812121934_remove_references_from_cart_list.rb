class RemoveReferencesFromCartList < ActiveRecord::Migration[7.0]
  def change
    remove_reference :cart_lists, :item, null: false, foreign_key: true
    remove_reference :cart_lists, :category, null: false, foreign_key: true
  end
end
