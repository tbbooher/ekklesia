class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :title, null: false
      t.string :summary
      t.string :official_title
      t.string :short_title
      t.string :popular_title
      t.string :congress_url, null: false
    end
  end
end
