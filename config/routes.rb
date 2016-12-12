Rails.application.routes.draw do
  mount API::IotFocus => '/api'
  root 'home#index'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
