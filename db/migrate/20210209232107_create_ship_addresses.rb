class CreateShipAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :ship_addresses do |t|

      t.string     :building
      t.string     :address,   null: false
      t.string     :city,      null: false
      t.integer    :prefecture_id, null: false
      t.string     :zip_code,  null: false
      t.string     :phone_num, null: false
      t.references :user,      null: false, foreign_key: true
      t.references :order,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
