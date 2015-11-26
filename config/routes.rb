Rails.application.routes.draw do

  resources :ads #'resources' is a method which declares a standard REST resource
  # and automatically defines routes for all standard RESTful actions

  root :to => 'ads#index' #requests to root of application are mapped to index action
end
