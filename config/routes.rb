Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#index"

  resource :user 

  resources :products do
    resources :reviews, except: %i(index new show)
  end
end
