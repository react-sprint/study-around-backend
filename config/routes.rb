Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  
  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  post 'auth_user' => 'authentication#authenticate_user'
  get 'api/test'

  post 'project/create' => 'project#create'
  post 'project/join' => 'project#join'
  get 'project/:authorization_password' => 'project#show'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
