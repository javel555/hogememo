Rails.application.routes.draw do
  get 'edit/index'

  root 'home#index'
  get 'home/index'

  devise_for :users, :controllers => { :omniauth_callbacks => "user/omniauth_callbacks"}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
