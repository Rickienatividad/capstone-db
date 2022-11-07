Rails.application.routes.draw do
  #users

  post "/users" => "users#create"
end
