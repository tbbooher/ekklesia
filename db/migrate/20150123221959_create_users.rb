class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :middle_name, default: ''
      t.string :username, null: false
      t.string :city
      t.text :about

      t.float :fiscal_initial, default: 0
      t.float :social_initial, default: 0

      t.float :fiscal_mean, default: 0
      t.float :fiscal_var, default: 0.1

      t.float :social_mean, default: 0
      t.float :social_var, default: 0.1

      t.string :password_digest, null: false
      t.string :email, null: false
      t.string :donation_email, default: false

      t.timestamps
    end
  end
end
