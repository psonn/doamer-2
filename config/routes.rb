Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get 'errors/not_found'

  get 'errors/internal_server_error'

#  resources :pins , :path => '', :only => [:show, :update, :destroy]
  resources :pins do
    member do
      get 'like', to: "pins#like"
      get 'unlike', to: "pins#unlike"
    end
  end

  root "pins#index"
  resources :properties
  resources :property_pictures
  scope "properties/:property_id" do
    resources :property_steps
  end
  resources :activities
  resources :pictures, :only => [:index, :create, :destroy]
  get "about" => "pages#about"
  get 'contact' => 'contacts#new'
  # error pages
  %w( 400 404 422 500 503 ).each do |code|
    get code, :to => "errors#show", :code => code
  end
  resources "contacts", only: [:new, :create]
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'} 
  resources :users, :path => '', only: [:show]

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
end
