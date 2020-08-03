require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe "Validations" do
    it {should validate_presence_of :number}
    it {should validate_presence_of :date}
    it {should validate_presence_of :departure_city}
    it {should validate_presence_of :arrival_city}
  end

  describe "Relationships" do
    it {should have_many :passenger_flights}
    it {should have_many(:passengers).through(:passenger_flights)}
    it {should belong_to :airline}
  end

  describe "Methods" do
    before :each do
      airline_1 = Airline.create(name: "Totally not Falling")
      @flight_1 = airline_1.flights.create(number: 12, date: "08/24/2020", departure_city: "Los Angeles", arrival_city: "Portland")
      @flight_1.passengers.create(name: "Jerrod", age: 14)
      @flight_1.passengers.create(name: "Jennine", age: 24)
      @flight_1.passengers.create(name: "Harold", age: 34)
      @flight_1.passengers.create(name: "Samantha", age: 18)
      @flight_1.passengers.create(name: "Ash", age: 9)
    end

    it ".minor_count" do
      expect(@flight_1.minor_count).to eq(2)
    end

    it ".adult_count" do
      expect(@flight_1.adult_count).to eq(3)
    end
  end
end
