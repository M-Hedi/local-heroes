class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :status_store
      t.string :status_customer
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
