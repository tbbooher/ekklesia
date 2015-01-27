class AddRollIdToBills < ActiveRecord::Migration
  def change
    add_column :bills, :roll_id, :string
  end
end
