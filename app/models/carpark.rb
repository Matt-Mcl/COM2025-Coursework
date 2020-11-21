class Carpark < ApplicationRecord
  validates :name, :address, presence: true
  validates :name, uniqueness: true
end
