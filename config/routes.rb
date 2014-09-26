Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
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
  scope "(:locale)", :locale => /uk|pl/ do
  get '/test' => 'main#testing', as: 'testing'
  get '/contacts' => 'main#contacts', as: 'contacts'

  get '/publication' => 'main#all_publication', as: 'all_publication'
  get '/publication/:url' => 'main#one_article', as: "one_article"

  get '/tablecloth' => 'product#all_tablecloth', as: 'all_tablecloth'

  get '/product/:category' => 'product#one_item', as: 'one_product'
  get '/:category/:name' => 'product#product_detail', as: 'product_detail'

  get '/sets' => 'product#all_sets', as: 'all_sets'

  get '/decors' => 'product#all_decors', as: 'all_decors'

  get '/special_offers' => 'main#special_offers', as: 'special_offers'




  root "main#index"

  end
end
