Rails.application.routes.draw do
  resources :documents
  resources :pd_files
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
  root 'pd_files#index'
end
