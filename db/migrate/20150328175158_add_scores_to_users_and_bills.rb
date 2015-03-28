class AddScoresToUsersAndBills < ActiveRecord::Migration
  def change
    add_column(:users, :social_score, :decimal)
    add_column(:users, :fiscal_score, :decimal)
    add_column(:bills, :social_score, :decimal)
    add_column(:bills, :fiscal_score, :decimal)
  end
end