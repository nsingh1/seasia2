Railscamp::Application.routes.draw do
  

  get "verifys/edit"

  get "verify/edit"

  get "sessions/new"
  resources :verifys
  resources :password_resets

  resources :floads

  resources :comments
  resources :microposts do
resources :comments
resources :floads
end

  resources :users
  resources :invites
  
  resources :sessions, :only => [:new, :create, :destroy]
  resources :projects, :only=> [:index, :create, :destroy, :new, :edit, :show, :update, :discuss, :verify]do
	resources :invites
	resources :microposts
        resources :floads 
        

end
match '/notification', :to  => 'users#notification'
get "edit1_user"  => "users#edit1"
get "new_resetpasses"  => "resetpasses#new"
match '/signin',  :to => 'sessions#new'
match '/signout',  :to => 'sessions#destroy'
match '/signup',  :to => 'users#new'
match '/help',    :to   => 'staticpages#help'
  match '/about',   :to => 'staticpages#about'
  match '/contact', :to => 'staticpages#contact'
  match 'projects/show', :to => 'projects#show'
  match 'microposts/show', :to => 'microposts#show'
  get "microposts/show"
  get "projects/show"
  get "staticpages/home"

 get "staticpages/home"
 get "staticpages/about"
 get "staticpages/contact"
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
   root :to => 'staticpages#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
match '*a', :to => 'errors#routing'
end
