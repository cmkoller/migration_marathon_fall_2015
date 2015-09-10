class AddFirstAndLastNameToReaders < ActiveRecord::Migration
  def up
    # add first name column
    add_column :readers, :first_name, :string

    # add last name column
    add_column :readers, :last_name, :string

    # For each reader in the database
    Reader.all.each do |reader|
      # split their name up into two parts
      names_array = reader.name.split(" ")
      # assign the first name value
      reader.first_name = names_array[0]
      # assign the last name value
      reader.last_name = names_array[1]
      # save that new info to the database
      reader.save
    end

    # remove the un-needed name column
    remove_column :readers, :name

    # make first name require
    change_column :readers, :first_name, :string, null: false
  end

  def down
    add_column :readers, :name, :string

    Reader.all.each do |reader|
      name = "#{reader.first_name} #{reader.last_name}"
      reader.name = name
      reader.save
    end

    remove_column :readers, :first_name
    remove_column :readers, :last_name

    change_column :readers, :name, :string, null: false
  end
end
