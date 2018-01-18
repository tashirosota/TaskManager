Rails.application.routes.draw do

  resources :users do
  end

  get 'admin/users', to: 'users#index'

  resources :tasks do
  end
  get 'certification', to: 'users#certification'
  get '', to: 'users#sign_in'
  get 'root', to: 'users#sign_in'

end
