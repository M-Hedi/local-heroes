class AddStoreIdToOrders < ActiveRecord::Migration[7.1]
  def change
    add_reference :orders, :store, null: false, foreign_key: true
  end
end
