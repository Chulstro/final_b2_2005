class PassengerFlightsController < ApplicationController
  def create
    flight = Flight.where(number: params[:number]).first
    PassengerFlight.create(flight_id: flight.id, passenger_id: params[:passenger_id])
    redirect_to "/passengers/#{params[:passenger_id]}"
  end
end
