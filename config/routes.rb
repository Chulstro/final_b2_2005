Rails.application.routes.draw do

  get "/flights/:flight_id", to: 'flights#show'

  get "/passengers/:passenger_id", to: 'passengers#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
