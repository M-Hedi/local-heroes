class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :category
      t.integer :discount
      t.integer :stock
      t.integer :loyalty_price
      t.string :status
      t.text :desciption
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
