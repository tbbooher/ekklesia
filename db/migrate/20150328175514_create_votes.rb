class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user
      t.references :bill
      t.decimal :social_score
      t.decimal :fiscal_score
    end
  end
end
