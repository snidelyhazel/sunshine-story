class CreateFlowerTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :flower_types do |t|
      t.string :name
      t.string :color
      t.integer :growth_duration_seconds
      t.integer :buy_price
      t.integer :sell_price
      t.integer :max_water_interval
      t.integer :harvest_duration_seconds
      t.string :graphic

      t.timestamps
    end
  end
end
