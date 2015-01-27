class CreateBreakdown < ActiveRecord::Migration
  def change
    create_table :breakdowns do |t|
      t.integer :r_yea
      t.integer :r_nay
      t.integer :d_yea
      t.integer :d_nay
      t.references :bill
    end
  end
end
