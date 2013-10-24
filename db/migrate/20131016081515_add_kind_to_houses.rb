class AddKindToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :kind, :integer
  end
end
