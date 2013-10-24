class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :name
      t.string :zipcode
      t.string :address
      t.string :telphone
      t.integer :capacity
      t.integer :is_pet
      t.integer :bicycle_space
      t.integer :bike_space
      t.integer :car_space
      t.integer :owner_id
	  t.attachment :photo1
      t.timestamps
    end
  end
end
