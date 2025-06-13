class DefautValuesForLatAndLngUser < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :latitude, 50.63159
    change_column_default :users, :longitude, 3.05978

    reversible do |dir|
      dir.up do
        User.where(latitude: nil).update_all(latitude: 50.63159)
        User.where(longitude: nil).update_all(longitude: 3.05978)
      end
    end
  end
end
