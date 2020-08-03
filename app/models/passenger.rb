class Passenger < ApplicationRecord
  validates_presence_of :name, :age
  belongs_to :flight
end
