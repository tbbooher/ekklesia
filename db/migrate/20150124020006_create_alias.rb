class CreateAlias < ActiveRecord::Migration
  def change
    create_table :aliases do |t|
      t.references :legislator, null: false
			t.string :alias1
			t.string :alias2
			t.string :alias3
			t.string :alias4
			t.string :alias5
			t.string :alias6
    end
  end
end
