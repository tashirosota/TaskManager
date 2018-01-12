Rails.application.routes.draw do
  resources :tasks do
  end
  get '', to: 'tasks#index'
  get 'root', to: 'tasks#index'
end
