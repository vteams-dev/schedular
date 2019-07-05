Rails.application.routes.draw do

  # get 'calenders/new'
  # get 'calenders/update'
  # get 'calenders/delete'
  # get 'calenders/show'
  resources :calenders
  root 'static_pages#home'
  # get 'static_pages/help'
  # root 'users#home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root to: 'home#index'
end
