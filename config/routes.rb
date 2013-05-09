Store::Application.routes.draw do
  root :to => 'static_pages#index'

  get 'index', :to => 'static_pages#index'
  get 'join', :to => 'static_pages#join'
  post 'register', :to => 'static_pages#register'
  get 'sign_in', :to => 'static_pages#signin'
  get 'about', :to => 'static_pages#about'
  get 'sign_out', :to => 'sessions#destroy'

  resources :profile
  resources :products
  resources :sessions, :only => [ :new, :create, :destroy ]
  resources :categories do
    resources :subcategories
  end

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
