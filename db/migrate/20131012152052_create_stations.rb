class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.integer :line_id
      t.integer :sort
      t.integer :group_id
      t.string :name
      t.string :zipcode
      t.string :address
      t.integer :pref_cd
      t.decimal :lon
      t.decimal :lat
      t.integer :display_flg

      t.timestamps
    end
  end
end
