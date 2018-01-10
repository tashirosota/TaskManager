Rails.application.routes.draw do
  resources :tasks
  get 'root_path', to: 'tasks#index'
  get '', to: 'tasks#index'
end
