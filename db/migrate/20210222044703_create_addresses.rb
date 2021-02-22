class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.integer :zip_code
      t.integer :prefecture_id
      t.references :user
      t.timestamps
    end
  end
end
