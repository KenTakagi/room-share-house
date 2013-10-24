class CreateRailCompanies < ActiveRecord::Migration
  def change
    create_table :rail_companies do |t|
      t.integer :rr_id
      t.string :name
      t.string :url
      t.integer :company_type
      t.integer :status
      t.integer :sort

      t.timestamps
    end
  end
end
