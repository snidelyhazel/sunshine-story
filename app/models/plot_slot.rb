class PlotSlot < ApplicationRecord
  # https://guides.rubyonrails.org/active_record_validations.html#validation-helpers

  belongs_to :user_profile
  validates :user_profile, presence: true

  validates_presence_of :x
  validates_numericality_of :x, :greater_than_or_equal_to => 0
  validates_presence_of :y
  validates_numericality_of :y, :greater_than_or_equal_to => 0

  belongs_to :flower_type
  validates :flower_type, presence: true

  validates_presence_of :when_planted
  validate :when_planted_after_game_created

  def when_planted_after_game_created
    if when_planted < DateTime.new(2021,01,01,0,0,0)
      errors.add :when_planted, "when_planted must be after game created"
    end
  end

  validates_presence_of :when_watered
  validate :when_watered_after_when_planted

  def when_watered_after_when_planted
    if when_watered < when_planted
      errors.add :when_watered, "when_watered must be after when_planted"
    end
  end

end
