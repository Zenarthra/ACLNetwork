Rails.application.routes.draw do
    
  
root "pages#home"
get 'pages/home', to: 'pages#home'
get '/testing', to: 'testings#home'
get '/testsignup', to: 'testings#signup'
get '/signup', to: 'users#new'

get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'



#get '/articles', to: 'articles#index'
#get '/articles/new', to: 'articles#new', as: 'new_article' #Provides new route for articles and prefix is now defined new_article
#get '/articles/:id', to: 'articles#show', as: 'article' #As means make this the prefix, prefix are helpers for routes in controller

#Above not needed when we use resources
resources :articles do
    resources :comments, only: [:create]
  end
resources :users, except: [:new]
resources :categories, except: [:destroy]
  
end
