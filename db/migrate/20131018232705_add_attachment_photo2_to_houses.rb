class AddAttachmentPhoto2ToHouses < ActiveRecord::Migration
  def self.up
    change_table :houses do |t|
      t.attachment :photo2
    end
  end

  def self.down
    drop_attached_file :houses, :photo2
  end
end
