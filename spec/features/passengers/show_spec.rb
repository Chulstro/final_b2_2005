require 'rails_helper'

RSpec.describe "When I visit a passengers show page" do
  before :each do
    airline_1 = Airline.create(name: "Totally not Falling")
    @flight_1 = airline_1.flights.create(number: 12, date: "08/24/2020", departure_city: "Los Angeles", arrival_city: "Portland")
    @flight_2 = airline_1.flights.create(number: 13, date: "08/30/2020", departure_city: "Los Santos", arrival_city: "Denver")
    @passenger_1 = @flight_1.passengers.create(name: "Jerrod", age: 14)
    @passenger_2 = @flight_1.passengers.create(name: "Jennine", age: 24)
    PassengerFlight.create(passenger: @passenger_1, flight: @flight_2)
  end

  it "shows all the passengers flights and their info" do
    visit "/passengers/#{@passenger_1}"

    expect(page).to have_content(@passenger_1.name)
    expect(page).to have_content(@passenger_1.age)
    expect(page).to have_link(@flight_1.number)
    expect(page).to have_link(@flight_2.number)

    click_on "#{@flight_1.number}"
    expect(current_path).to eq("/flights/#{@flight_1.id}")
  end
end
