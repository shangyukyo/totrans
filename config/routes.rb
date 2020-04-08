Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do 
    root 'topics#index'

    resources :topics do
      collection do 
        post :upload
      end

      member do 
        get :delete
      end
    end

    resources :contacts 
    resources :users do 
      member do 
        get :delete
      end
    end

    resources :session, only: [] do 
      collection do 
        get   :login
        post  :login
        get   :sign_out
      end
    end
  end

  root to: "welcome#index"
  scope controller: :welcome do 
    get   :index
    get   :international
    get   :express
    get   :customs_clearance
    get   :european_warehousing
    get   :blogs
    get   :contact
    post  :set_locale
  end

  get '/blog/:slug', to: 'welcome#blog', trailing_slash: true, as: 'blog'

end
