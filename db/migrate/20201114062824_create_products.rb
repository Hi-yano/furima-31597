class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :user,          null: false, foreign_key: true
      t.string :product_name,      null: false
      t.text :explanation,         null: false
      t.integer :category_id,      null: false
      t.integer :status_id,        null: false
      t.integer :postage_id,       null: false
      t.integer :area_id,          null: false
      t.integer :shipping_id,      null: false
      t.string :product_price,     null: false
      t.timestamps
    end
  end
end
