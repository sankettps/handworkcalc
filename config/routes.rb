Rails.application.routes.draw do
  mount Swaggard::Engine, at: '/api_docs/swagger/'
  root to: "home#index" 
  get '/api' => redirect('/api_docs/swagger/')
  namespace :api do
		namespace :v1 do
      resources :materials
  		post 'auth_user' => 'authentication#authenticate_user'
  		get 'user_info' => 'users#show'
  		post 'sign_up' => 'registrations#sign_up'
  		# handles 404
  		match '*path', :to => 'authentication#routing_error', via: :all
		end
  end
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
