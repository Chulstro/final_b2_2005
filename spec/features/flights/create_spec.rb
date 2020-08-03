require 'rails_helper'

RSpec.describe "When I fill a form on a passengers show page" do
  before :each do
    airline_1 = Airline.create(name: "Totally not Falling")
    @flight_1 = airline_1.flights.create(number: 12, date: "08/24/2020", time: "4:00 PM PDT", departure_city: "Los Angeles", arrival_city: "Portland")
    @flight_2 = airline_1.flights.create(number: 13, date: "08/30/2020", time: "5:00 AM PDT", departure_city: "Los Santos", arrival_city: "Denver")
    @passenger_1 = @flight_1.passengers.create(name: "Jerrod", age: 14)
    @passenger_2 = @flight_1.passengers.create(name: "Jennine", age: 24)
  end
  it "will assign a new flight to a passenger" do
    visit "/passengers/#{@passenger_1.id}"
    expect(page).to_not have_content(@flight_2.number)

    expect(page).to have_field(:number)

    fill_in :number, with: @flight_2.number
    click_on "Submit"

    expect(current_path).to eq("/passengers/#{@passenger_1.id}")
    expect(page).to have_link(@flight_2.number)
  end
end
