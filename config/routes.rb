Lifecare::Application.routes.draw do
  match '/update' => 'home#update', :as => :update
  match '/features' => 'home#features', :as => :features
  match '/mine' => 'home#mine', :as => :mine	

  resources :blogs do 
  	get 'comment', :on => :member
  end  

  scope 'communities' do
    match '/:community_id/columns/:id' => 'widgets/columns#show', :as => :community_column
    match '/:community_id/articles/:id' => 'widgets/articles#show', :as => :community_article
    match '/:community_id/articles/:id/comment' => 'widgets/articles#comment', :as => :comment_community_article  

    match '/:community_id/forum/:id' => 'widgets/forums#show', :as => :community_forum
    match '/:community_id/topics/:id' => 'widgets/topics#show', :as => :community_topic
    match '/:community_id/topics/:id/comment' => 'widgets/topics#comment', :as => :comment_community_topic

    match '/:community_id/qas/:id' => 'widgets/qas#show', :as => :community_qa
    match '/:community_id/questions/:id' => 'widgets/questions#show', :as => :community_question

    match '/:community_id/poll_sets/:id' => 'widgets/poll_sets#show', :as => :community_poll_set
    match '/:community_id/polls/:id' => 'widgets/polls#show', :as => :community_poll
    match '/:community_id/polls/:id/comment' => 'widgets/polls#comment', :as => :comment_community_poll
  end  

  resources :communities do
    resources :sections

    scope :module => "widgets" do
      resources :bulletins, only: [:edit, :update]
      resources :forums, :only => :update do
        resources :topics, except: :show
      end  
      resources :poll_sets, :only => :update do
        resources :polls, except: :show
      end 
      resources :qas, :only => :update do
        resources :questions, except: :show
      end  
      resources :columns, :only => :update do
        resources :articles, except: :show
      end
    end

    get 'admin', :on => :member
    get 'join', :on => :member
    get 'leave', :on => :member
  end

  resources :phrs do
    scope :module => "phrs" do
      resources :conditions
      resources :symptoms
      resources :treatments
    end
  end

  authenticated :user do
    root :to => 'home#update'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end