class RemoveTelphoneAndAddressFromHouses < ActiveRecord::Migration
  def change
    remove_column :houses, :telphone, :string
    remove_column :houses, :address, :string
  end
end
