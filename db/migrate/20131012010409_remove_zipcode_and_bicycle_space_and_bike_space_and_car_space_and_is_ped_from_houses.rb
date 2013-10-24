class RemoveZipcodeAndBicycleSpaceAndBikeSpaceAndCarSpaceAndIsPedFromHouses < ActiveRecord::Migration
  def change
    remove_column :houses, :zipcode, :string
    remove_column :houses, :bicycle_space, :integer
    remove_column :houses, :bike_space, :integer
    remove_column :houses, :car_space, :integer
    remove_column :houses, :is_pet, :integer
  end
end
