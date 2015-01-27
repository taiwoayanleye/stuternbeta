Rails.application.routes.draw do

  resources :shortlistings

  get 'blog/index'

  resources :job_applications

  resources :saved_student_profiles

  resources :saved_job_postings

  resources :searches

  #Website root page
  # root 'blog#index'
  root 'job_postings#search'
  
  #RailsAdmin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # devise_for :users
  # # devise_for :users

  #Devise routes
  devise_for :users, :controllers => {:registrations => "registrations"}, 
                      :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  #devise_for :users, :controllers => {:users => "users"}
  
  #Student resources
  resources :skills
  resources :stu_references
  resources :stu_certifications
  resources :stu_interests
  resources :stu_work_experiences
  #resources :users
  resources :job_postings do
    collection do
      get 'search'
    end
    # Job application link from job postings page
    resources :job_applications, only: [:new, :create]
    # Creating URLs and caching for pagination
    get 'page/:page', :action => :search, :on => :collection
  end
  resources :company_profiles
  resources :office_photos

  # resources :company_profiles do
  #   resources :office_photos, :only => [:create, :destroy]
  # end
  resources :student_profiles do
    collection do
      get 'search'
    end
  # Creating friendly URLs and caching for pagination
  get 'page/:page', :action => :search, :on => :collection
  end  


  get 'home/home'
  get 'pages/about'
  get 'pages/contact'
  get 'pages/board_and_advisors'
  get 'pages/for_companies'
  get 'pages/for_schools'
  get 'pages/for_students'
  get 'pages/getting_started'
  get 'pages/investors'
  get 'pages/partners'
  get 'pages/success_stories'
  get 'registrations/destroy'

  get 'company_posting' => "job_postings#company_posting"
  get 'offers' => "job_applications#offers"
  get 'applicants' => "job_applications#applicants"

  #Blog
  # get '/blog' => redirect('/blog/')

  #Company page
  # get 'company_profiles/:id/who_we_are' => 'company_profiles#who_we_are', as: :who_we_are
  get 'company_profiles/:id/internship' => 'company_profiles#internship', as: :internship
  get 'company_profiles/:id/social' => 'company_profiles#social', as: :social
  get 'company_profiles/:id/qanda' => 'company_profiles#qanda', as: :qanda  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # mount Monologue::Engine, at: '/idea'
end
