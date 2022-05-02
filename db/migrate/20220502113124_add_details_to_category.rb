class AddDetailsToCategory < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :user, null: false, foreign_key: true
    add_column :categories, :name, :string
  end
end
