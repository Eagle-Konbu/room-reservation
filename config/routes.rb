Rails.application.routes.draw do
  get 'reservations/mine' => 'reservations#my_reservations'
  resources :reservations

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # devise_for :users
  Rails.application.routes.draw do
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
