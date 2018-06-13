Rails.application.routes.draw do
  resources :words
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
