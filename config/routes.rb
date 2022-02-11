Rails.application.routes.draw do
  resources :mining_types
  #get 'welcome/index'
  resources :coins
  resources :descriptions
  # Para encontrar as rotas enquanto estiver em desenvolvimento, use http://localhost:3000/rails/info/routes
  resources :welcome do
    collection do
      get :define_locale
    end
  end
  root to: 'welcome#index'  #define a homepage do API
end
