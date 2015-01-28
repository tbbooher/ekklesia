class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.references :user
      t.references :stance, null: false
      t.references :legislator, null: false
      t.integer :amount, null: :false
      t.timestamps
    end
  end
end
