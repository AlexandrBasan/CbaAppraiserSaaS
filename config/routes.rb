CbaAppraiserSoft::Application.routes.draw do
  resources :systems

  resources :capartments

  resources :chouses

  resources :cearths

  resources :anhouseholds

  resources :kolrooms

  resources :tiphouses

  resources :repairs

  resources :currencies

  resources :anearts

  resources :anaprtments

  resources :houses

  resources :earths

  resources :apartments

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/calc_apartment', to: 'calc_pages#calc_apartment', via: 'get'
  match '/calc_earths', to: 'calc_pages#calc_earths', via: 'get'
  match '/calc_houses', to: 'calc_pages#calc_houses', via: 'get'
  match '/calc_apartment_print', to: 'calc_pages#calc_apartments_print', via: 'get'
  match '/calc_earth_print', to: 'calc_pages#calc_earths_print', via: 'get'
  match '/calc_house_print', to: 'calc_pages#calc_houses_print', via: 'get'
  resources :apartments do
    collection do
      post :import
    end
  end
  resources :earths do
    collection do
      post :import
    end
  end
  resources :houses do
    collection do
      post :import
    end
  end
  resources :anaprtments do
    collection do
      post :import
    end
  end
  resources :anearts do
    collection do
      post :import
    end
  end
  resources :anhouseholds do
    collection do
      post :import
    end
  end
  resource :apartments do
    collection do
      post :import
    end
  end

  resource :apartments do
    collection do
      post :download_pdf
    end
  end

   match '/processing', to: 'apartments#processing', via: 'get'
   match '/processing_earth', to: 'earths#processing_earth', via: 'get'
   match '/processing_house', to: 'houses#processing_house', via: 'get'

  scope '/destroy_all' do
    resources :anhouseholds, only: [:index], to: 'anhouseholds#destroy_all', via: 'delete', as: 'anhouseholds_destroy_all'
    resources :apartments, only: [:index], to: 'apartments#destroy_all', via: 'delete', as: 'apartments_destroy_all'
    resources :anearts, only: [:index], to: 'anearts#destroy_all', via: 'delete', as: 'anearts_destroy_all'
    resources :anaprtments, only: [:index], to: 'anaprtments#destroy_all', via: 'delete', as: 'anaprtments_destroy_all'
    resources :houses, only: [:index], to: 'houses#destroy_all', via: 'delete', as: 'houses_destroy_all'
    resources :earths, only: [:index], to: 'earths#destroy_all', via: 'delete', as: 'earths_destroy_all'
    resources :apartments, only: [:index], to: 'apartments#destroy_all', via: 'delete', as: 'apartments_destroy_all'
  end
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

  root to: 'static_pages#home'
end
