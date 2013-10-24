class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :name
      t.integer :sort
      t.integer :status
      t.integer :company_id

      t.timestamps
    end
  end
end
