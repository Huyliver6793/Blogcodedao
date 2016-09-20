Rails.application.routes.draw do

  root 'static_pages#home'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'signup' => 'users#new'
  get 'post' => 'static_pages#post'


  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts do
  	resources :comments, only: [:index, :create, :new, :show]
  	get '/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment
  end
  resources :relationships,  only: [:create, :destroy,:show]

end
