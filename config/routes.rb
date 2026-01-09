Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  root "flights#index"
  get "flights/index"
  get "/flights" => "flights#index"
  get "bookings/new"
  get "bookings/:booking_id" => "bookings#show", as: :booking
  post "bookings" => "bookings#create"

  # TODO: search and view on same page. Set up your FlightsController and
  # routes to make the Index page (/flights) the root route.
  # Create your search form on the /flights index page to submit
  # using a GET (not POST) request back to the same URL.
end
