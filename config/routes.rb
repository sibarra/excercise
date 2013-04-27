Store::Application.routes.draw do
  root :to => 'static_pages#index'

  get 'index', :to => 'static_pages#index'
  get 'join', :to => 'static_pages#join'
  post 'register', :to => 'static_pages#register'
  get 'signin', :to => 'static_pages#signin'
  post 'login', :to => 'static_pages#login'
  get 'about', :to => 'static_pages#about'

  resources 'profile'
  resources 'products'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
