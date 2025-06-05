class RenameDesciptionToDescriptionInProducts < ActiveRecord::Migration[7.0]
  def up
    rename_column :products, :desciption, :description
  end

  def down
    rename_column :products, :description, :desciption
  end
end
