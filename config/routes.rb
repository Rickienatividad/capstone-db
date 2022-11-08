Rails.application.routes.draw do
  #users

  post "/users" => "users#create"

  #sessions
  post "/sessions" => "sessions#create"

  #entry
  get "/entries" => "entries#index"
  get "/entries/:id" => "entries#show"
  post "/entries" => "entries#create"
  patch "/entries/:id" => "entries#update"
  delete "/entries/:id" => "entries#destroy"

  #fish
  get "/fishes" => "fishes#index"
  get "/fishes/:id" => "fishes#show"
  post "/fishes" => "fishes#create"
  patch "/fishes/:id" => "fishes#update"
  delete "/fishes/:id" => "fishes#destroy"

  #lures
  get "/lures" => "lures#index"
  get "/lures/:id" => "lures#show"
  post "/lures" => "lures#create"
  patch "/lures" => "lures#update"
  delete "/lures/:id" => "lures#destroy"
end
