Reddit::Application.routes.draw do
  resources :users, only: [:create, :new, :show]

  resource :session, only: [:create,:new, :destroy]

  resources :subs, except: [:destroy] do
    resources :posts, except: [:index]
  end

  resources :comments, only: [:new, :create]
end
