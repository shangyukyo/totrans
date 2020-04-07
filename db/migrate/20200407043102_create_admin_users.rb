class CreateAdminUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_users do |t|
      t.string :login, null: false, index: true, unique: true
      t.string :username, null: false
      t.string :password_digest, null: false
      t.text :extras      
      t.timestamps
    end
  end
end
