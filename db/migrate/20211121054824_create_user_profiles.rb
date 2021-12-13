class CreateUserProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_profiles do |t|
      t.string :user_name
      t.integer :sun_penny
      t.timestamp :last_update

      t.timestamps
    end
  end
end
