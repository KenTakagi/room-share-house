class RemoveSexFromHouses < ActiveRecord::Migration
  def change
    remove_column :houses, :sex, :integer
  end
end
