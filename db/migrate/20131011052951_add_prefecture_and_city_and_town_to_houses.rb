class AddPrefectureAndCityAndTownToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :prefecture, :string
    add_column :houses, :city, :string
    add_column :houses, :town, :string
  end
end
