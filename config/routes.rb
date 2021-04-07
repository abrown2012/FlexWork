Rails.application.routes.draw do
  # root 'jobs#homepage'
  # get '/employer/signup' => 'employers#new'
  # post '/employer/signup' => 'employers#create'
  # get '/contractor/signup' => 'contractors#new'
  # post '/contractor/signup' => 'contractors#create'
  resources :categories
  resources :contractors
  resources :job_applicants
  resources :jobs
  resources :employers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
