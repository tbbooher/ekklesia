class CreateTerm < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.references :legislator, null: false
			t.string :start_date
	    t.string :end_date
	    t.string :state
	    t.string :party
	    t.string :senate_class
	    t.string :title
	    t.string :chamber
    end
  end
end
