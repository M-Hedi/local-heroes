class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.text :description
      t.string :title
      t.date :start_date
      t.date :end_date
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
