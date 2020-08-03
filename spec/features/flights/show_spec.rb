require 'rails_helper'

RSpec.describe "When visiting a flights show page" do
  before :each do
    airline_1 = Airline.create(name: "Totally not Falling")
    @flight_1 = airline_1.flights.create(number: 12, date: "08/24/2020", time: "4:00 PM PDT", departure_city: "Los Angeles", arrival_city: "Portland")
    @flight_1.passengers.create(name: "Jerrod", age: 14)
    @flight_1.passengers.create(name: "Jennine", age: 24)
    @flight_1.passengers.create(name: "Harold", age: 34)
    @flight_1.passengers.create(name: "Samantha", age: 18)
    @flight_1.passengers.create(name: "Ash", age: 9)
  end
  it "I see all of that flights info as well as airline and passengers" do
    visit "/flights/#{@flight_1.id}"

    expect(page).to have_content("12")
    expect(page).to have_content("08/24/2020")
    expect(page).to have_content("4:00 PM PDT")
    expect(page).to have_content("Los Angeles")
    expect(page).to have_content("Portland")
    expect(page).to have_content("Totally not Falling")
    expect(page).to have_content("Jerrod")
  end

  it "has a count of all minors and adults on the flight" do
    visit "/flights/#{@flight_1.id}"

    expect(page).to have_content("Minors Aboard: 2")
    expect(page).to have_content("Adults Aboard: 3")
  end
end
