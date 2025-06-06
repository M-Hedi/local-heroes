class FixProductDescriptionColumnName < ActiveRecord::Migration[7.0]
  def change
    if column_exists?(:products, :desciption)
      rename_column :products, :desciption, :description
    end
  end
end
