Massolit::Application.routes.draw do

  mount StripeEvent::Engine => '/stripe'
  get "content/silver"
  get "content/gold"
  get "content/platinum"
  get "admin/index"

  authenticated :subscriber do
    root :to => 'static_pages#home'
  end
  root :to => 'static_pages#home'
  
  devise_for :subscribers

  authenticated :user do
    root :to => 'static_pages#home'
  end
  root :to => "static_pages#home"
 
 devise_for :users, :controllers => { :registrations => 'registrations' }
  devise_scope :user do
    put 'update_plan', :to => 'registrations#update_plan'
    put 'update_card', :to => 'registrations#update_card'
  end

  get 'tags/:tag' => 'courses#index', :as => :tag

  devise_scope :user do 
    root to: 'static_pages#home'
    match '/sessions/user', to: 'devise/sessions#create', via: :post
    match '/sessions/user.new', to: 'devise/sessions#create', via: :post
  end

  devise_scope :subscriber do
    root to: 'static_pages#home'
    match '/sessions/subscriber', to: 'devise/sessions#create', via: :post
    match '/sessions/subscriber.new', to: 'devise/sessions#create', via: :post
  end

  resources :users
  resources :courses
  resources :providers
  resources :imports
  resources :lessons
  resources :relationships, only: [:create, :destroy]
  resources :learners
  resources :teachers
  scope "/admin" do
    resources :subscribers do
      member do
        get :studying
      end
    end
  end
  resources :schools
  resources :videos
  resources :transcripts
  resources :handouts
  resources :quizzes
  resources :questions
  resources :answers
  resources :scores
  resources :movies
  resources :banners
  resources :books
  resources :essays
  resources :sources
  resources :trailers
  resources :samples
  resources :options

  # The following lines match actions from weirdly-named controllers to simpler paths.
  # Instead of /static_pages/about, for example, we have /about

  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  match '/helpus',  to: 'static_pages#helpus'
  match '/faqs',    to: 'static_pages#faqs'
  match '/samplecourses', to: 'static_pages#samples'
  match '/privacypolicy', to: 'static_pages#privacypolicy'
  match '/enduseragreement', to: 'static_pages#enduseragreement'
  match '/pricing', to: 'static_pages#pricing'

  match '/subscribers', to: 'subscribers#index'

  match '/ourschools', to: 'static_pages#ourschools'
  match '/school_feedback', to: 'static_pages#school_feedback'
  match '/school_users', to: 'static_pages#school_users'
  match '/individual_users', to: 'static_pages#individual_users'
  match '/contributors', to: 'static_pages#contributors'

  match '/studentsplash', to: 'static_pages#studentsplash'
  match '/teachersplash', to: 'static_pages#teachersplash'

  match '/coursedash',    to: 'courses#coursedash'
 
  match '/addcourse',     to: 'courses#addcourse'
  match '/addlecture',    to: 'lessons#addlecture'
  match '/addtranscript', to: 'transcripts#addtranscript'
  match '/addhandout',    to: 'handouts#addhandout'
  match '/addmovie',      to: 'movies#addmovie'
  match '/addbanner',     to: 'banners#addbanner'
  match '/addbook',       to: 'books#addbook'
  match '/addtrailer',    to: 'trailers#addtrailer'
  match '/addsample',     to: 'samples#addsample'

  match '/check', to: 'quizzes#check'

  unless Rails.application.config.consider_all_requests_local
    match '*not_found', to: 'errors#error_404'
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
