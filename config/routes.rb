Rails.application.routes.draw do
  root 'tasks#homepage'
  get 'auth/:provider/callback', to: 'sessions#omniauth'


  get '/about' => 'tasks#about'

  get '/logout' => 'sessions#destroy'
 
  get '/newuser/account_type' => 'sessions#account_type', as: "account_type"
  post '/newuser/account_type' => 'sessions#account_type', as: "complete_signup"
   
  get '/search' => 'welcome#search'
  post '/search' => 'welcome#search'
   
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/employers' => 'users#employers'
 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
 
  resources :users, only: [:new, :create, :show, :edit, :update] do
    resources :tasks, only: [:index, :new]
  end 
  
  resources :tasks

  resources :categories, only: [:index] do
    resources :tasks, only: [:index]
  end
  
  resources :categories, only: [:new, :index, :show, :create] do 
    resources :tasks, only: [:index]
  end 

end
