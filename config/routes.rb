Rails.application.routes.draw do
  
  # get 'advertisements/index'
  resources :advertisements

  resources :posts

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
