Rails.application.routes.draw do
  resources :categories
  resources :contractors
  resources :applicants
  resources :job_applicants
  resources :jobs
  resources :employers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
