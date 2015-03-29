class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user
      t.references :bill
      t.string :direction
      t.timestamps
    end
  end
end
