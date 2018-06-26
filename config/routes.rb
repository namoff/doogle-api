Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/:word_name', to: 'words#search', as: 'word'
end
