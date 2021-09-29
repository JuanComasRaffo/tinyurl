Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'urls#index'

  resources :urls, only: %i[index create show], param: :url do
    member do
      get :info
    end
  end
  post ':short_url', to: 'urls#visit', as: :visit
end
