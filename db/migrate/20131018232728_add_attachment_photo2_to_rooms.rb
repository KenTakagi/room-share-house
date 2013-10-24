class AddAttachmentPhoto2ToRooms < ActiveRecord::Migration
  def self.up
    change_table :rooms do |t|
      t.attachment :photo2
    end
  end

  def self.down
    drop_attached_file :rooms, :photo2
  end
end
