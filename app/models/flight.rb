class Flight < ApplicationRecord
  validates_presence_of :number, :date, :departure_city, :arrival_city
  belongs_to :airline
  has_many :passengers
end
