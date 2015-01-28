class AddStanceValuesToBills < ActiveRecord::Migration
  def change
    add_column :bills, :yea_stance, :integer
    add_column :bills, :nay_stance, :integer
  end
end
