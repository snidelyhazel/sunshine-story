class CreatePlotSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :plot_slots do |t|
      t.references :user_profile, null: false, foreign_key: true
      t.integer :x
      t.integer :y
      t.references :flower_type, null: false, foreign_key: true
      t.timestamp :when_planted
      t.timestamp :when_watered

      t.timestamps
    end
  end
end
