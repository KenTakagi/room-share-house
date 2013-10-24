class AddAttachmentPhoto1ToHouses < ActiveRecord::Migration
  def self.up
    change_table :houses do |t|
      t.attachment :photo1
    end
  end

  def self.down
    drop_attached_file :houses, :photo1
  end
end
