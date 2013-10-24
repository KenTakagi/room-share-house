class AddDepositToRoom < ActiveRecord::Migration
  def change
    add_column :rooms, :deposit, :integer
  end
end
