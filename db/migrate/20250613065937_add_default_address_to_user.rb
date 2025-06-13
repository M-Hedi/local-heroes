class AddDefaultAddressToUser < ActiveRecord::Migration[7.1]
  def change
   change_column_default :users, :address, "150 rue Léon Gambetta, Lille"
  end
end
