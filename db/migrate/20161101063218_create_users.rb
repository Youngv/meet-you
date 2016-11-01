class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :confirm_token
      t.string :auth_token
      t.datetime :confirmed_at

      t.timestamps
    end
    add_index :users, :confirm_token, unique: true
    add_index :users, :auth_token, unique: true
  end
end
