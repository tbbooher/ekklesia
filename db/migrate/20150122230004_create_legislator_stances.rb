class CreateLegislatorStances < ActiveRecord::Migration
  def change
    create_table :legislator_stances do |t|
      t.references :legislator, null: false
      t.references :stance, null: false
    end
  end
end
