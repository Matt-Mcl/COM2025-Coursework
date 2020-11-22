class Space < ApplicationRecord
  belongs_to :carpark
  validates :carpark, :space_number, :hourly_cost, presence: true
end

