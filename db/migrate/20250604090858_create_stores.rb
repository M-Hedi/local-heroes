class CreateStores < ActiveRecord::Migration[7.1]
  def change
    create_table :stores do |t|
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.string :name
      t.string :category
      t.string :phone_number

      t.timestamps
    end
  end
end
