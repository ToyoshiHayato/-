Rails.application.routes.draw do
  root :to => 'homes#top'
  resources :books
  #get '/top' => 'homes#top'
  #get 'books/:id' => 'books#show'
  #patch 'books/:id' => 'books#update',as: 'update_book'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end