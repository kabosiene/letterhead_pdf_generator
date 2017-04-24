Rails.application.routes.draw do
  resources :documents do
    member do
      get 'show_plain'
      get 'show_document'
      get 'show_title'
      get 'show_green_corner'
    end
  end

  resources :pd_files
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
  root 'documents#index'
end
