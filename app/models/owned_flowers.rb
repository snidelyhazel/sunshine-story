class OwnedFlowers < ApplicationRecord
  # https://guides.rubyonrails.org/active_record_validations.html#validation-helpers

  belongs_to :user_profile
  validates :user_profile, presence: true

  belongs_to :flower_type
  validates :flower_type, presence: true

  validates_presence_of :quantity
  validates_numericality_of :quantity, :greater_than_or_equal_to => 0
end
