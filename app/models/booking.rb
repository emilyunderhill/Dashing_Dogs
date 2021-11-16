class Booking < ApplicationRecord
  belongs_to :outfit
  belongs_to :user
  validates :date_from, presence: true
  validates :date_to, presence: true
end
