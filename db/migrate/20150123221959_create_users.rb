class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :middle_name, default: ''
      t.string :username, null: false
      t.string :city
      t.text :about

      t.string :password_digest, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
