Rails.application.routes.draw do
  
  #route for the versions table
  post "versions/:id/revert" => "versions#revert", as: "revert_version"
  
  #nicely renamed for user experience improvements
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'status', to: 'materials#status', as: 'status'
  get 'status_version', to: 'versions#status', as: 'status_version'
  
  resources :users
  resources :sessions
  resources :materials do 
	collection do
	 post :import
	 put :edit_status_multiple
	 end
  end

  root :to => 'materials#index'
	
end
