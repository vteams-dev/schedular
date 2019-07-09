Rails.application.routes.draw do

  # get 'calendars/new'
  # get 'calendars/update'
  # get 'calendars/delete'
  # get 'calendars/show'
  resources :calendars
  root 'calendars#index'
  # get 'static_pages/help'
  # root 'users#home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root to: 'home#index'
end
