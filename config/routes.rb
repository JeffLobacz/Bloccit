Rails.application.routes.draw do

  get 'comments/new'

  get 'summaries/index'

  devise_for :users
  resources :users, only: [:update]

  resources :topics do
    resources :posts, except: [:index] do
      resources :comments
      end
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
