Rails.application.routes.draw do
  resources :tasks
  get 'root_path', to: 'tasks#index'
  get 'tasks_path', to: 'tasks#sort_by_deadline'
  get '', to: 'tasks#index'
end
