class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.text   :explanation, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :postage_type_id, null: false
      t.integer :prefectures_id, null: false
      t.integer :preparation_day_id, null: false
      t.integer :value, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
