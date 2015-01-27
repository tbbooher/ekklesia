class CreateBreakdown < ActiveRecord::Migration
  def change
    create_table :breakdowns do |t|
      t.string :r_yea
      t.string :r_nay
      t.string :d_yea
      t.string :d_nay
      t.references :bill
    end
  end
end
