class AddNoteToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :note, :text
  end
end
