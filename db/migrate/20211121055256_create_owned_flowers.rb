class CreateOwnedFlowers < ActiveRecord::Migration[6.0]
  def change
    create_table :owned_flowers do |t|
      t.references :user_profile, null: false, foreign_key: true
      t.references :flower_type, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
