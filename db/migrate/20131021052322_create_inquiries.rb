class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.integer :to_userid
      t.integer :from_userid
      t.string :subject
      t.text :body
      t.datetime :received_time
      t.datetime :deleted_time_by_sender
      t.datetime :deleted_time_by_recipient

      t.timestamps
    end
  end
end
