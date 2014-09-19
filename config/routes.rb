Massolit::Application.routes.draw do

  mount StripeEvent::Engine => '/stripe'
 
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users

  devise_scope :user do
    match 'teacher/sign_up' => 'registrations#new', :user => { :rolable_type => 'teacher' }
    match 'student/sign_up' => 'registrations#new', :user => { :rolable_type => 'student' }
    match 'member/sign_up'  => 'registrations#new', :user => { :rolable_type => 'member'}, :plan => 'topaz'
    match 'admin/sign_up'   => 'registrations#new', :user => { :rolable_type => 'admin'}
  end

  devise_scope :user do
    put 'update_card', :to => 'registrations#update_card'
  end

  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post

  authenticated :subscriber do
    root :to => 'static_pages#home'
  end
  root :to => 'static_pages#home'

  authenticated :user do
    root :to => 'static_pages#home'
  end
  root :to => 'static_pages#home'

  devise_for :subscribers
  
  get 'tags/:tag' => 'courses#index', :as => :tag
  get 'tags/:lessontag' => 'courses#index', :as => :lessontag

  devise_scope :subscriber do
    root to: 'static_pages#home'
    match '/sessions/subscriber', to: 'devise/sessions#create', via: :post
    match '/sessions/subscriber.new', to: 'devise/sessions#create', via: :post
  end

  resources :mailchimp do
    collection do
      get :subscribe, :as => :subscribe
    end   
  end
  resources :imports
  resources :relationships, only: [:create, :destroy]
  resources :learners
  resources :teachers

  scope '/admin' do
    resources :schools
    resources :providers, only: [:new, :edit, :create, :index]
    resources :lessons,   only: [:new, :edit, :create, :index]
    resources :courses,   only: [:new, :edit, :create]

    resources :subscribers do
      member do
        get :studying
      end
    end
  end

  resources :providers, except: [:new, :edit, :create, :index]
  resources :lessons,   except: [:new, :edit, :create, :index]
  resources :courses,   except: [:new, :edit, :create]
  
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

  # Static Pages

  match '/about',         to: 'static_pages#about'
  match '/samples',       to: 'static_pages#samples'
  match '/privacy',       to: 'static_pages#privacy'
  match '/terms',         to: 'static_pages#terms'
  match '/pricing',       to: 'static_pages#pricing'
  match '/testimonials',  to: 'static_pages#testimonials'
  match '/blog',          to: 'static_pages#blog'
  match '/jobs',          to: 'static_pages#jobs'
  match '/press',         to: 'static_pages#press'


  match '/admin/courses',         to: 'courses#coursedash'
  match '/admin/subscribers',     to: 'subscribers#index'
  match '/admin/users',           to: 'users#index'
  match '/admin/lectures',        to: 'lessons#lessondash'
  match '/admin/videos',          to: 'movies#index'
  match '/admin/tutors',          to: 'providers#index'
  match '/admin/trailers',        to: 'trailers#index'

  match '/admin/add-school',      to: 'schools#new'
  match '/admin/add-tutor',       to: 'providers#new'
  match '/admin/add-course',      to: 'courses#addcourse'
  match '/admin/add-lecture',     to: 'lessons#new'
  match '/admin/add-video',       to: 'movies#addmovie'
  match '/admin/add-trailer',     to: 'trailers#addtrailer'

  match '/admin/edit-tutor',       to: 'providers#edit'

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
