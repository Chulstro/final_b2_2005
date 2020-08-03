Rails.application.routes.draw do

  get "/flights/:flight_id", to: 'flights#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
