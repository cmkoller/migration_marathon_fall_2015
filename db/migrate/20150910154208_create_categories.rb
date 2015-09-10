class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |table|
      table.string :genre, null: false
    end
    add_index :categories, :genre, unique: true
  end
end
