class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :middle_name, default: ''
      t.string :username, null: false
      t.string :city
      t.text :about
      t.decimal :fiscal_mean, default: 0
      t.decimal :fiscal_var, default: 0.1

      t.decimal :social_mean, default: 0
      t.decimal :social_var, default: 0.1

      t.string :password_digest, null: false
      t.string :email, null: false
      t.string :donation_email, default: false

      t.timestamps
    end
  end
end
