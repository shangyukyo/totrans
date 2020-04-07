Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do 
    root 'topics#index'

    resources :topics do
      collection do 
        post :upload
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
end
