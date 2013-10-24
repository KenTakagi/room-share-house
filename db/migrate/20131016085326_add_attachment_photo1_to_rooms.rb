class AddAttachmentPhoto1ToRooms < ActiveRecord::Migration
  def self.up
    change_table :rooms do |t|
      t.attachment :photo1
    end
  end

  def self.down
    drop_attached_file :rooms, :photo1
  end
end
