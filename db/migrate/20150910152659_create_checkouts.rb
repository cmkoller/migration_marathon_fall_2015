class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.string :patron, null: false
      t.date :due_date, null: false
      t.integer :book_id, null: false
      #t.belongs_to :book, null: false  <---same as the line above, essentially
      t.timestamps null: false
    end

    add_index :checkouts, :book_id
    add_index :checkouts, :patron
  end
end
