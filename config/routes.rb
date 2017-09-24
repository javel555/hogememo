Rails.application.routes.draw do
  root 'home#index'


  get 'edit', to: 'edit#show'
  post 'edit/tag/:id', to: 'edit#add_tag'

  post 'search', to: 'search#update'




  devise_for :users, :controllers => { :omniauth_callbacks => "user/omniauth_callbacks"}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
