class Property < ApplicationRecord
  validates :property_name, presence: true
  validates :rent_price, presence: true, length: { minimum: 1 }, numericality: true
  validates :address, presence: true
  validates :age, presence: true, length: { minimum: 1 }, numericality: true
  validates :remark, presence: true
  has_many :stations, dependent: :destroy, inverse_of: :property
  accepts_nested_attributes_for :stations
end
