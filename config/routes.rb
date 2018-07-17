Rails.application.routes.draw do
  
  namespace :admin do

  end

 
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :edit, :create]

  resources :ideas do
 
     resources :reviews, only: [:create, :destroy]

  end

  # # Routes for IdeasController
  # get "/ideas/new", to: "ideas#new", as: :new_idea
  # post "/ideas", to: "ideas#create", as: :ideas
  # get "/ideas/:id", to: "ideas#show", as: :idea
  # get "/ideas", to: "ideas#index"
  # get "/ideas/:id/edit", to: "ideas#edit", as: :edit_idea
  # patch "/ideas/:id", to: "ideas#update"
  # put "/ideas/:id", to: "ideas#update"
  # delete "/ideas/:id", to: "ideas#destroy"
  
  get('/', { to: 'idea#index', as: 'home' })


end