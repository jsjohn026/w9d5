Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :new, :create] #sign up, see profile
  resource :session, only: [:new, :create, :destroy] #login & logout

  resources :bands

end
