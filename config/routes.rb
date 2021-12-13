Rails.application.routes.draw do
  resources :customer_requests
  resources :plot_slots
  resources :owned_flowers
  resources :owned_seeds
  resources :flower_types
  resources :user_profiles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/' => 'game#index'
  get '/u/:id/' => 'game#home'
  get '/u/:id/shop' => 'game#shop'
  post '/u/:id/purchase' => 'game#purchase'
  get '/u/:id/plant/:flower_type_id' => 'game#plant'
  post '/u/:id/plant/:flower_type_id' => 'game#plant_here'
  post '/u/:id/harvest' => 'game#harvest_here'
  get '/u/:id/requests' => 'game#requests'
  post '/u/:id/sell' => 'game#sell'
  post '/u/:id/expand' => 'game#expand'

  post 'user_profiles/login' => 'user_profiles#login'
  post 'user_profiles/signup' => 'user_profiles#signup'
end


#  get 'usstates/new' => 'usstates#new'
#  get 'usstates/:id' => 'usstates#show', :as => 'show_usstate'
#  get 'usstates' => 'usstates#index'
#  post 'usstates/new' => 'usstates#create'
#  get 'usstates/:id/delete' => 'usstates#destroy', :as => 'destroy_usstate'
#  get 'usstates/:id/edit' => 'usstates#edit', :as => 'edit_usstate'
#  post 'usstates/:id/edit' => 'usstates#update'
#  post 'usstates/find' => 'usstates#find'
