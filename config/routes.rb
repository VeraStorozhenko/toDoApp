Rails.application.routes.draw do
  get 'item/index'
  resources :elements
  root 'item#index' #контроллер/вьюшка
end
