Rails.application.routes.draw do
  get 'welcome/index'
  #resources :toDoElement
  resources :lists
  root 'welcome#index' #контроллер/вьюшка
end
