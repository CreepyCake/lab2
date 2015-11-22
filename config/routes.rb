Rails.application.routes.draw do


  resources :ads

  root :to => 'ads#index'
end
