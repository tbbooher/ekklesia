class CreateLegislatorPositions < ActiveRecord::Migration
  def change
    create_table :legislator_positions do |t|
      t.references :legislator
      t.references :issue
      t.decimal :position_value
    end
  end
end
