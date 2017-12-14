Rails.application.routes.draw do

  get 'career/index'
  get 'career/show'

  root 'main#index'
  get 'main/index'
  get 'main/search'

  get 'ranking/index'
  get 'ranking/show'

  get 'trend/index'
  get 'trend/show'


  resources :services

  resources :companies do
    member do
      get '/detail' => 'companies#detail'
    end
  end

  resources :company_fields do
    member do
    end
  end

  resources :stacks do
    member do
      post '/register_interesting' => 'stacks#register_interesting', as: 'register_inter'
      post '/register_my_stack' => 'stacks#register_my_stack', as: 'register_my'
    end
    collection do
      get '/add_stack' => 'stacks#add_stack', as: 'add_my'
    end
  end

  resources :stack_fields

  #devise controller 생성했더니 이거 추가하라 했음 ㅠㅠㅠ....
  devise_for :users, controllers: {
    # omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :admin do
    resources :users do
    end
  end

  namespace :enter do
    resources :companies do
      resources :services do
        member do
          get '/add_stack' => 'services#add_stack', as: 'add_stack_to'
        end
        collection do
          post '/regist_stack' => 'services#regist_stack', as: 'register_stack'
          delete '/delete_stack' => 'services#delete_stack', as: 'delete_stack_to'
        end
      end
    end
  end

  namespace :indi do
    post '/regist_stack' => 'users#regist_stack', as: 'register_stack'
    resources :users do
      collection do
        get '/add_stack' => 'users#add_stack', as: 'add_my'
      end
    end
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
end
