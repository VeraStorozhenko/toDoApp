Rails.application.routes.draw do
  get 'item/index'
  resources :elements
  root 'item#index' #контроллер/вьюшка

  put '/elements/:id/check', to: 'elements#check'
  get '/destroy_all', to: 'elements#destroy_all'
end
