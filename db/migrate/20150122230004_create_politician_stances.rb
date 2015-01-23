class CreatePoliticianStances < ActiveRecord::Migration
  def change
    create_table :politician_stances do |t|
      t.references :politician, null: false
      t.references :stance, null: false
    end
  end
end
