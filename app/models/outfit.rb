class Outfit < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos
  validates :name, presence: true
  validates :size, inclusion: { in: ["extra small", "small", "medium", "large", "extra large"] }
  validates :price, numericality: { only_integer: true }
  validates :max_loan_period, numericality: { only_integer: true }
end
