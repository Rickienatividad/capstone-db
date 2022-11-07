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
end
