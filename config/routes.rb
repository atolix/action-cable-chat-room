Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  root to: 'rooms#new'
  
  resources :rooms, only: [:new, :show, :create], param: :slug do
    resources :messages, only: [:create]
    resources :questions, only: [:create]
  end
end
