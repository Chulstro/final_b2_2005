require 'rails_helper'

RSpec.describe "When visiting a flights show page" do
  before :each do
    airline_1 = Airline.create(name: "Totally not Falling")
    @flight_1 = airline_1.flights.create(number: 12, date: "08/24/2020", departure_city: "Los Angeles", arrival_city: "Portland")
    @flight_1.passengers.create(name: "Jerrod", age: 14)
  end
  it "I see all of that flights info as well as airline and passengers" do
    visit "/flights/#{@flight_1.id}"

    expect(page).to have_content("12")
    expect(page).to have_content("08/24/2020")
    expect(page).to have_content("Los Angeles")
    expect(page).to have_content("Portland")
    expect(page).to have_content("Totally not Falling")
    expect(page).to have_content("Jerrod")
  end
end
