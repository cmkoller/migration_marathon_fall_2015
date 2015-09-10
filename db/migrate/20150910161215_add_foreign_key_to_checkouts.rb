class AddForeignKeyToCheckouts < ActiveRecord::Migration
  def up
    add_column :checkouts, :reader_id, :integer
    Checkout.all.each do |checkout|
      name = checkout.patron
      reader = Reader.find_by(name: name)
      checkout.reader = reader
      checkout.save
    end
    change_column :checkouts, :reader_id, :integer, null: false
    remove_column :checkouts, :patron
  end

  def down
    add_column :checkouts, :patron, :string

    Checkout.all.each do |checkout|
      reader = checkout.reader
      name = reader.name
      checkout.patron = name
      checkout.save
    end

    change_column :checkouts, :patron, :string, null: false
    add_index :checkouts, :patron
    remove_column :checkouts, :reader_id
  end
end
