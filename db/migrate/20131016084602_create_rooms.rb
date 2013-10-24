class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :house_id
      t.string :name
      t.string :largeness
      t.integer :kind
      t.integer :facilities
      t.integer :sex
      t.integer :rent
      t.integer :expense
      t.text :note
      t.boolean :enable
      t.integer :nationality

      t.timestamps
    end
  end
end
