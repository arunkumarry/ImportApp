Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "pages#home"
  post '/' => "pages#import"

  resources :candidates do
  	resources :notes
  end
  resources :jobs
end
