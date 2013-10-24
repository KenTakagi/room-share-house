class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.integer :user_id
      t.integer :kind
      t.string :subject
      t.text :body
      t.string :prefecture
      t.string :city
      t.string :town
      t.integer :sex
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
