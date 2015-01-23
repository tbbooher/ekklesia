class CreatePoliticians < ActiveRecord::Migration
  def change
    create_table :politicians do |t|
      t.string :bioguide_id, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :middle_name
      t.string :nickname
      t.string :name_suffix
      t.string :party, null: false
      t.string :phone, null: false
      t.string :website, null: false
      t.string :office, null: false
      t.string :contact_form, null: false
      t.string :fax, null: false
      t.string :twitter_id
      t.string :campaign_twitter_ids
      t.string :youtube_id
      t.string :facebook_id
    end
  end
end
