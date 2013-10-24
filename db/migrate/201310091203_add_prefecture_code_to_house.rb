class AddPrefectureCodeToHouse < ActiveRecord::Migration
  def change
      add_column :houses, :prefecture_code, :integer
  end
end
