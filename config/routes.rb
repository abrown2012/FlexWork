Rails.application.routes.draw do
   root 'tasks#homepage'
   get '/about' => 'tasks#about'
 
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
 
   resources :users, only: [:new, :create, :show, :edit, :update]
   resources :categories, only: [:index]
   resources :products 

  end
