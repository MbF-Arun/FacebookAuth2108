Rails.application.routes.draw do
  resources :templates
  # resources :passwords
  devise_for :users, skip: :all
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" , :passwords => 'users/passwords'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "templates#index"
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'

  end

end
