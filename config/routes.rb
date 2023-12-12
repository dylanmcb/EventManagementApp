Rails.application.routes.draw do
  devise_for :users
  resources :events do
    resources :registrations, only: %i[create destroy]

    collection do
      delete 'delete_all_from_index', to: 'events#delete_all_from_index'
    end
  end
  root 'events#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
