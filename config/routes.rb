Rails.application.routes.draw do
    
  
root "pages#home"
get 'pages/home', to: 'pages#home'
get '/articles', to: 'articles#index'
get '/articles/:id', to: 'articles#show', as: 'article' #As means make this the prefix, prefix are helpers for routes in controller


  
end
