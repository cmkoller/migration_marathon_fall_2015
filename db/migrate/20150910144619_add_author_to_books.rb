class AddAuthorToBooks < ActiveRecord::Migration
  def up
    add_column :books, :author, :string

    Book.all.each do |book|
      book.author = "Unknown"
      book.save
    end

    change_column :books, :author, :string, null: false
  end

  def down
    remove_column :books, :author
  end
end
