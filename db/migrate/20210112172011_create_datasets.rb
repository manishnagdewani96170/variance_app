class CreateDatasets < ActiveRecord::Migration[5.2]
  def change
    create_table :datasets do |t|
      t.decimal  :temperature, precision: 5, scale: 2, null: :false
      t.datetime :recorded_at
      t.timestamps
    end
  end
end
