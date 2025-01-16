Rails.application.routes.draw do
  resource :map, only: [:show] 

  namespace :admin do
    
  end

  devise_for :users, controllers: { sessions: 'public/sessions',registrations:'public/registrations' }
  devise_for :admin, skip: [:registrations, :password], controllers: { sessions: 'admin/sessions' }
  scope module: :public do
    root "homes#top" 
    get '/', to: 'homes#top'
    get '/about', to: 'homes#about', as: :about
    resources :posts, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
      resource :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update] do
      collection do
        post :guest_sign_in
      end
    end
    resources :searchs
    resources :genres
  end
 
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
    resources :comments, only: [:index, :destroy]
  end

  # get 'searchs/index'
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # #post '/users/sign_up' => 'users#sign_up'
  get 'dashboards', to: 'dashboards#index'
  resources :users, only: [:show, :edit, :update, :destroy]
  get 'mypage', to: 'users#mypage'
end