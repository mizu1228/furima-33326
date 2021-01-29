class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string     :item,             null: false
      t.text       :explanation,      null: false
      t.integer    :price,            null: false
      # t.references :user,             null: false, foreign_key: true
      # ↑↑ usersテーブルがまだ存在しないのでコメントアウト ↑↑
      t.integer    :category_id,      null: false
      t.integer    :prefecture_id,    null: false
      t.integer    :when_post_id,     null: false
      t.integer    :item_status_id,   null: false
      t.integer    :shipping_cost_id, null: false
      t.timestamps
    end
  end
end
