class RemovePrefectureCodeFromHouses < ActiveRecord::Migration
  def change
    remove_column :houses, :prefecture_code, :integer
  end
end
