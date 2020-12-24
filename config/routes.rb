Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Astronauts
  get "/astronauts", to: "astronauts#index"

end
