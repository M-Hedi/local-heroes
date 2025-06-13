class ChangeDefaultAddressToUser < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :address, "158 Rue Léon Gambetta, 59000, Lille, France"
  end
end
