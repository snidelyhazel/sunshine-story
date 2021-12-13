class FlowerType < ApplicationRecord
  # https://guides.rubyonrails.org/active_record_validations.html#validation-helpers

  validates_presence_of :name
  validates_length_of :name, :maximum => 20
  validates_presence_of :color
  validates_inclusion_of :color, :in => ['purple', 'white', 'red', 'yellow', 'pink', 'orange', 'blue']
  validates_presence_of :growth_duration_seconds
  validates_numericality_of :growth_duration_seconds, :greater_than => 0
  validates_presence_of :buy_price
  validates_numericality_of :buy_price, :greater_than => 0
  validates_presence_of :sell_price
  validates_numericality_of :sell_price, :greater_than => :buy_price
  validates_presence_of :max_water_interval
  validates_numericality_of :max_water_interval, :less_than => :growth_duration_seconds
  validates_presence_of :harvest_duration_seconds
  validates_numericality_of :harvest_duration_seconds, :greater_than => 0
  validates_presence_of :graphic
  validates_format_of :graphic, :with => /\.png\Z/

end
