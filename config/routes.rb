Rails.application.routes.draw do
  get '/employer/signup' => 'employers#new'
  post '/employer/signup' => 'employers#create'
  get '/applicant/signup' => 'applicants#new'
  post '/applicant/signup' => 'applicants#create'
  resources :categories
  resources :applicants
  resources :job_applicants
  resources :jobs
  resources :employers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
