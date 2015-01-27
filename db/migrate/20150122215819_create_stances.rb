class CreateStances < ActiveRecord::Migration
  def change
    create_table :stances do |t|
      t.references :user, null: false
      t.references :position, null: false

      t.timestamps
    end
  end
end
