Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  root to: 'rooms#show'
  get 'rooms/show'
end
