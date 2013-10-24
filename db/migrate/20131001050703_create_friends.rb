class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :name
      t.string :address
      t.has_attached_file :avatar

      t.timestamps
    end
  end
end
