class CreateItemBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :item_brands do |t|

      t.references :item, foreign_key: true
      t.references :brand, foreign_key: true
      t.timestamps
    end
  end
end
