class CustomerRequest < ApplicationRecord

  belongs_to :user_profile
  validates :user_profile, presence: true

  belongs_to :flower_type
  validates :flower_type, presence: true

  validates_presence_of :quantity
  validates_numericality_of :quantity, :greater_than => 0

end
