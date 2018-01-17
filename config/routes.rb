Rails.application.routes.draw do
  resources :users do

  end

  resources :tasks do
  end
  get 'certification', to: 'users#certification'
  get '', to: 'users#sign_in'
  get 'root', to: 'users#sign_in'

end
