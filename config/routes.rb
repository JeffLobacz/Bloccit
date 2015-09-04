Rails.application.routes.draw do

  get 'comments/new'

  get 'summaries/index'

  devise_for :users
  resources :users, only: [:update]

  
  resources :topics do |topics|
    topics.resources :posts, :name_prefix => "topic_"
  end


  resources :posts, except: [:index] do |posts|
    posts.resources :comments, :name_prefix => "post_"
  end

  resources :comments, only: [:create]
  

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
