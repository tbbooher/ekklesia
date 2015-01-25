class AddTimestampsToStances < ActiveRecord::Migration
  def change_table
    add_column(:stances, :created_at, :datetime)
    add_column(:stances, :updated_at, :datetime)
  end
end