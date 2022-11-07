Rails.application.routes.draw do
  #users

  post "/users" => "users#create"

  #sessions
  post "/sessions" => "sessions#create"
end
