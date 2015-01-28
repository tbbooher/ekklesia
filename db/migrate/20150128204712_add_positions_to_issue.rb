class AddPositionsToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :rposition, :text
    add_column :issues, :dposition, :text
  end
end
