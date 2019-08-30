class Station < ApplicationRecord
  validates :route_name, presence: true
  validates :station_name, presence: true
  validates :time_required, presence: true, length: { minimum: 1 }, numericality: true
  belongs_to :property, optional: true, inverse_of: :stations
end
