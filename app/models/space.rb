class Space < ApplicationRecord
  belongs_to :carpark
  has_many :tickets, dependent: :destroy
  validates :carpark, :space_number, :hourly_cost, presence: true
end

