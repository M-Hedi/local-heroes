class RenameDesciptionToDescriptionInProducts < ActiveRecord::Migration[7.1]
  def change
    rename_column :products, :desciption, :description
  end
end
