class CreateBreakdown < ActiveRecord::Migration
  def change
    create_table :breakdowns do |t|
      t.interger :r_yea
      t.interger :r_nay
      t.interger :d_yea
      t.interger :d_nay
      t.references :bill
    end
  end
end
