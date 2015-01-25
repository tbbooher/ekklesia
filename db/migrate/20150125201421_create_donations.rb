class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.references :user
      t.references :stance
      t.references :legislator
      t.integer :amount
      t.timestamps
    end
  end
end
