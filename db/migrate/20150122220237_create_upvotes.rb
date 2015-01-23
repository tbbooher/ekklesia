class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.references :user, null: false
      t.references :stance, null: false
    end
  end
end
