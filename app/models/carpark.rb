class Carpark < ApplicationRecord
  has_many :spaces, dependent: :destroy
  validates :name, :address, presence: true
  validates :name, uniqueness: true
end
