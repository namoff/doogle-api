Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  post '/', to: 'words#search', as: :root
  match '*path' => 'words#search', via: :post
end
