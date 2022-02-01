Rails.application.routes.draw do
  get "/meetings" => "meetings#index"
  get "/meetings/holidays" => "meetings#holidays"
end 
