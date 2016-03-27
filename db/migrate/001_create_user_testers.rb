class CreateUserTesters < ActiveRecord::Migration
  def change
    create_table :user_testers do |t|
      t.integer :user_id
      t.string :ciphered_password
    end
  end
end
