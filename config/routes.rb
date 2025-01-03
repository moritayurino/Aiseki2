Rails.application.routes.draw do
  devise_for :users
  # devise_for :admin, skip: [:registrations, :password], controllers: {
  # sessions: 'admin/sessions'
  # }
  # devise_for :users
 
  # namespace :admin do
  # get 'dashboards', to: 'dashboards#index'
  # end

  # get 'searchs/index'
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  # #post '/users/sign_up' => 'users#sign_up'
  get '/' => 'homes#top'  
  get '/about' => 'homes#about'
  resources :users, only: [:show, :edit, :update, :destroy]
  get 'mypage', to: 'users#mypage'
  resources :posts, only: [:new, :show, :edit, :update, :destroy]
  # resources :likes
  # resources :comments
  # resources :genres
  # resources :searchs
end