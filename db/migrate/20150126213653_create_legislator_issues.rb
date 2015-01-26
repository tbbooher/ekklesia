class CreateLegislatorIssues < ActiveRecord::Migration
  def change
    create_table :legislator_issues do |t|
      t.references :legislator
      t.references :issue
      t.float :issue_score
    end
  end
end
