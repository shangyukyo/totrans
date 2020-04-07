class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :support_email
      t.string :air_transpot_phone
      t.string :shipping_phone
      t.string :customer_service_phone
      t.string :address_1
      t.string :address_2
      t.text :extras
      t.timestamps
    end
  end
end
