class AddIssueIdToBillVotes < ActiveRecord::Migration
  def change
    add_column :bill_votes, :issue_id, :integer
  end
end
