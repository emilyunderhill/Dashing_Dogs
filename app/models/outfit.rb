class Outfit < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  validates :name, presence: true
  validates :size, inclusion: { in: %w(extra-small small medium large extra-large)
  validates :price, numericality: { only_integer: true }
  validates :max_loan_period, numericality: { only_integer: true }
end
