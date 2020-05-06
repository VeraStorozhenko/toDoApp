Rails.application.routes.draw do
  get 'list/index'
  #get 'welcome/index'
  root 'list#index'
end
