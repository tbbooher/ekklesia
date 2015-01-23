class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.references :issue, null: false
      t.text :description, null: false
    end
  end
end
