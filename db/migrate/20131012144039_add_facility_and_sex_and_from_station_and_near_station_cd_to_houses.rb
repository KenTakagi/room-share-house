class AddFacilityAndSexAndFromStationAndNearStationCdToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :facility, :bigint
    add_column :houses, :sex, :integer
    add_column :houses, :from_station, :integer
    add_column :houses, :near_station_cd, :integer
  end
end
