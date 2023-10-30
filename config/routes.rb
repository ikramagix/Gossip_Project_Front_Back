Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/', to: 'presentation#home'
  root 'presentation#home'

  get '/team', to: 'presentation#team'

  get '/contact', to: 'presentation#contact'

  get 'welcome/:first_name', to: 'welcome#greet' 
end