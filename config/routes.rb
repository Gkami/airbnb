

Rails.application.routes.draw do
  get 'braintree/new'

  root 'users#home'

  # start of clearance routes
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end


  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"


# end of clearance routes

  resources :listings 
  get "/mylistings" => "listings#userlisting", :as => :listing_user

  resources :users, only: [:edit, :update, :index]
  get '/users' => 'users#index', :as => :users_index

  resources :bookings, only: [:create, :destroy, :show, :edit, :update, :index]


  resources :searches, only: [:create]
  post '/search', to: 'listings#search', as: 'search' 

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  

  # get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  # delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  # get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

  get '/:id', to: 'listings#show'


  post 'braintree/checkout'
end
