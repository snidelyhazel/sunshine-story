class AddPlotSizeToUserProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :user_profiles, :plot_size, :integer
  end
end
