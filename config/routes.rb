Rails.application.routes.draw do
  
  # get 'advertisements/index'
  resources :advertisements

  get 'advertisements/show'

  resources :posts

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
